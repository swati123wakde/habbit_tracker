import 'package:freezed_annotation/freezed_annotation.dart';

import 'day_status.dart';
import 'habit.dart';

part 'habit_detail.freezed.dart';

/// A habit plus its recent history (oldest first, last entry = today).
@freezed
abstract class HabitDetail with _$HabitDetail {
  const HabitDetail._();

  const factory HabitDetail({
    required Habit habit,
    required List<DayStatus> history,
  }) = _HabitDetail;

  bool get isDoneToday => history.isNotEmpty && history.last.isDone;

  int get completedDays => history.where((d) => d.isDone).length;

  int get pointsEarned => completedDays * habit.points;

  /// Consecutive completed days ending today. If today isn't done yet the
  /// streak is still "alive" and is counted from yesterday.
  int get currentStreak {
    var days = history.reversed;
    if (days.isNotEmpty && !days.first.isDone) days = days.skip(1);
    var streak = 0;
    for (final day in days) {
      if (!day.isDone) break;
      streak++;
    }
    return streak;
  }
}
