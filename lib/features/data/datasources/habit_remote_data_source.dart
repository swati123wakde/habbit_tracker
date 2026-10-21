import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/error/exceptions.dart';
import '../models/habit_model.dart';
abstract interface class HabitRemoteDataSource {
  Stream<List<HabitModel>> watchHabits();
  Stream<HabitModel> watchHabit(String habitId);

  /// Ids of habits completed on [dayKey].
  Stream<Set<String>> watchCompletedHabitIds(String dayKey);

  /// Which of [dayKeys] the habit was completed on.
  Stream<Set<String>> watchCompletedDays(String habitId, List<String> dayKeys);

  Future<void> addHabit(HabitModel habit);
  Future<void> setCompletion({
    required String habitId,
    required String dayKey,
    required bool isDone,
  });
  Future<void> deleteHabit(String habitId);
}

class HabitRemoteDataSourceImpl implements HabitRemoteDataSource {
  HabitRemoteDataSourceImpl(this._firestore);

  final FirebaseFirestore _firestore;

  static const habitsCollection = 'habits';
  static const logsCollection = 'habit_logs';

  CollectionReference<Map<String, dynamic>> get _habits =>
      _firestore.collection(habitsCollection);

  CollectionReference<Map<String, dynamic>> get _logs =>
      _firestore.collection(logsCollection);

  static String logId(String habitId, String dayKey) => '${habitId}_$dayKey';

  @override
  Stream<List<HabitModel>> watchHabits() => _habits
      .orderBy('createdAt')
      .snapshots()
      .map((s) => s.docs.map(HabitModel.fromFirestore).toList())
      .handleError(_rethrowAsServer);

  @override
  Stream<HabitModel> watchHabit(String habitId) =>
      _habits.doc(habitId).snapshots().map((doc) {
        if (!doc.exists) {
          throw const NotFoundException('This habit no longer exists.');
        }
        return HabitModel.fromFirestore(doc);
      }).handleError(_rethrowAsServer);

  @override
  Stream<Set<String>> watchCompletedHabitIds(String dayKey) => _logs
      .where('date', isEqualTo: dayKey)
      .snapshots()
      .map((s) => s.docs.map((d) => d.data()['habitId'] as String).toSet())
      .handleError(_rethrowAsServer);

  @override
  Stream<Set<String>> watchCompletedDays(
      String habitId,
      List<String> dayKeys,
      ) =>
      _logs
          .where(
        FieldPath.documentId,
        whereIn: [for (final k in dayKeys) logId(habitId, k)],
      )
          .snapshots()
          .map((s) => s.docs.map((d) => d.data()['date'] as String).toSet())
          .handleError(_rethrowAsServer);

  @override
  Future<void> addHabit(HabitModel habit) =>
      _guard(() => _habits.add(habit.toCreateMap()));

  @override
  Future<void> setCompletion({
    required String habitId,
    required String dayKey,
    required bool isDone,
  }) =>
      _guard(() {
        final ref = _logs.doc(logId(habitId, dayKey));
        return isDone
            ? ref.set({
          'habitId': habitId,
          'date': dayKey,
          'completedAt': FieldValue.serverTimestamp(),
        })
            : ref.delete();
      });

  @override
  Future<void> deleteHabit(String habitId) => _guard(() async {
    final logs = await _logs.where('habitId', isEqualTo: habitId).get();
    final batch = _firestore.batch();
    for (final doc in logs.docs) {
      batch.delete(doc.reference);
    }
    batch.delete(_habits.doc(habitId));
    await batch.commit();
  });

  Future<void> _guard(Future<void> Function() action) async {
    try {
      await action();
    } on FirebaseException catch (e) {
      throw ServerException(e.message ?? e.code);
    }
  }

  static Never _rethrowAsServer(Object error) {
    if (error is NotFoundException || error is ServerException) throw error;
    if (error is FirebaseException) {
      throw ServerException(error.message ?? error.code);
    }
    throw ServerException(error.toString());
  }
}
