import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../entities/daily_habit.dart';
import '../entities/habit_detail.dart';

/// Contract implemented by the data layer. Pure Dart: no Flutter/Firebase.
abstract interface class HabitRepository {
  /// All habits with their completion status on [day], kept live.
  Stream<Either<Failure, List<DailyHabit>>> watchHabitsForDay(DateTime day);

  /// A single habit with the last [days] days of history ending on [today].
  Stream<Either<Failure, HabitDetail>> watchHabitDetail(
      String habitId, {
        required DateTime today,
        int days = 7,
      });

  Future<Either<Failure, Unit>> addHabit({
    required String name,
    required String description,
    required int points,
  });

  Future<Either<Failure, Unit>> setCompletion({
    required String habitId,
    required DateTime day,
    required bool isDone,
  });

  Future<Either<Failure, Unit>> deleteHabit(String habitId);
}
