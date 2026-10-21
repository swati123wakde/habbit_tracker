part of 'today_habits_bloc.dart';

@freezed
sealed class TodayHabitsEvent with _$TodayHabitsEvent {
  const factory TodayHabitsEvent.started() = TodayHabitsStarted;
  const factory TodayHabitsEvent.dayCheckRequested() =
  TodayHabitsDayCheckRequested;
  const factory TodayHabitsEvent.toggled(DailyHabit item) = TodayHabitsToggled;
  const factory TodayHabitsEvent.updated(
      Either<Failure, List<DailyHabit>> result,
      ) = _TodayHabitsUpdated;
}
