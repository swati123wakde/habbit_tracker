part of 'habit_detail_bloc.dart';

enum HabitDetailStatus { initial, loading, success, failure, deleted }

@freezed
abstract class HabitDetailState with _$HabitDetailState {
  const factory HabitDetailState({
    @Default(HabitDetailStatus.initial) HabitDetailStatus status,
    String? habitId,
    DateTime? today,
    HabitDetail? detail,
    @Default(false) bool isUpdating,
    @Default(false) bool isDeleting,
    String? errorMessage,
    String? actionError,
  }) = _HabitDetailState;
}
