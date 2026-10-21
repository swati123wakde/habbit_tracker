import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/habit.dart';

part 'habit_model.freezed.dart';   // ← this line is missing

/// Firestore representation of a habit document in `habits/{id}`.
@freezed
abstract class HabitModel with _$HabitModel {
  const HabitModel._();

  const factory HabitModel({
    required String id,
    required String name,
    required String description,
    required int points,
    DateTime? createdAt,
  }) = _HabitModel;

  factory HabitModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> doc,
      ) {
    final data = doc.data() ?? const <String, dynamic>{};
    return HabitModel(
      id: doc.id,
      name: data['name'] as String? ?? '',
      description: data['description'] as String? ?? '',
      points: (data['points'] as num?)?.toInt() ?? 0,
      // Null while a serverTimestamp write is still pending locally.
      createdAt: (data['createdAt'] as Timestamp?)?.toDate(),
    );
  }

  /// Fields written when creating a habit. `createdAt` is set by the server.
  Map<String, dynamic> toCreateMap() => {
    'name': name,
    'description': description,
    'points': points,
    'createdAt': FieldValue.serverTimestamp(),
  };

  Habit toEntity() => Habit(
    id: id,
    name: name,
    description: description,
    points: points,
    createdAt: createdAt ?? DateTime.now(),
  );
}
