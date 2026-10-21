import 'package:flutter_test/flutter_test.dart';
import 'package:habbit_tracker/core/utils/day_utils.dart';
import 'package:habbit_tracker/features/domain/entities/day_status.dart';
import 'package:habbit_tracker/features/domain/entities/habit.dart';
import 'package:habbit_tracker/features/domain/entities/habit_detail.dart';

HabitDetail _detail(List<bool> done) {
  final today = DateTime(2026, 10, 21);
  final days = DayUtils.lastDays(today, done.length);
  return HabitDetail(
    habit: Habit(
      id: 'h1',
      name: 'Read',
      description: '',
      points: 10,
      createdAt: DateTime(2026, 1, 1),
    ),
    history: [
      for (var i = 0; i < days.length; i++)
        DayStatus(date: days[i], isDone: done[i]),
    ],
  );
}

void main() {
  group('HabitDetail', () {
    test('streak counts consecutive days ending today', () {
      final d = _detail([false, true, false, true, true, true, true]);
      expect(d.currentStreak, 4);
      expect(d.isDoneToday, isTrue);
      expect(d.completedDays, 5);
      expect(d.pointsEarned, 50);
    });

    test('streak stays alive from yesterday when today is not done', () {
      final d = _detail([false, false, false, false, true, true, false]);
      expect(d.currentStreak, 2);
      expect(d.isDoneToday, isFalse);
    });

    test('streak is zero when yesterday and today are missed', () {
      final d = _detail([true, true, true, true, true, false, false]);
      expect(d.currentStreak, 0);
    });
  });

  group('DayUtils', () {
    test('lastDays returns 7 consecutive dates ending today', () {
      final days = DayUtils.lastDays(DateTime(2026, 3, 2, 18), 7);
      expect(days.first, DateTime(2026, 2, 24));
      expect(days.last, DateTime(2026, 3, 2));
      expect(days.length, 7);
    });

    test('dayKey is zero padded', () {
      expect(DayUtils.dayKey(DateTime(2026, 1, 5)), '2026-01-05');
    });
  });
}
