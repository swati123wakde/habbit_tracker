import 'package:freezed_annotation/freezed_annotation.dart';

import 'habit.dart';

part 'daily_habit.freezed.dart';

/// A habit together with its completion status for one specific day.
@freezed
abstract class DailyHabit with _$DailyHabit {
  const factory DailyHabit({
    required Habit habit,
    required bool isDone,
  }) = _DailyHabit;
}
