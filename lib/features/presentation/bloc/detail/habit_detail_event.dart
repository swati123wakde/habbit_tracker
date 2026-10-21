part of 'habit_detail_bloc.dart';

@freezed
sealed class HabitDetailEvent with _$HabitDetailEvent {
  const factory HabitDetailEvent.started(String habitId) = HabitDetailStarted;
  const factory HabitDetailEvent.todayToggled() = HabitDetailTodayToggled;
  const factory HabitDetailEvent.deleteRequested() = HabitDetailDeleteRequested;
  const factory HabitDetailEvent.updated(
      Either<Failure, HabitDetail> result,
      ) = _HabitDetailUpdated;
}
