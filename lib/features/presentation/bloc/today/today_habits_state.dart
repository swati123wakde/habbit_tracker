part of 'today_habits_bloc.dart';

enum TodayHabitsStatus { initial, loading, success, failure }

@freezed
abstract class TodayHabitsState with _$TodayHabitsState {
  const TodayHabitsState._();

  const factory TodayHabitsState({
    @Default(TodayHabitsStatus.initial) TodayHabitsStatus status,
    @Default([]) List<DailyHabit> habits,
    DateTime? day,
    String? errorMessage,
    String? actionError,
  }) = _TodayHabitsState;

  int get completedCount => habits.where((h) => h.isDone).length;

  int get earnedPoints => habits
      .where((h) => h.isDone)
      .fold(0, (sum, h) => sum + h.habit.points);

  int get totalPoints => habits.fold(0, (sum, h) => sum + h.habit.points);

  double get progress =>
      habits.isEmpty ? 0 : completedCount / habits.length;
}
