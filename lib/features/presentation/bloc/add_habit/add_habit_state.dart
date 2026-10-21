part of 'add_habit_cubit.dart';

enum AddHabitStatus { idle, submitting, success, failure }

@freezed
abstract class AddHabitState with _$AddHabitState {
  const factory AddHabitState({
    @Default(AddHabitStatus.idle) AddHabitStatus status,
    String? errorMessage,
  }) = _AddHabitState;
}
