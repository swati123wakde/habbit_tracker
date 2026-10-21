import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/usecases/add_habit.dart';

part 'add_habit_cubit.freezed.dart';
part 'add_habit_state.dart';

class AddHabitCubit extends Cubit<AddHabitState> {
  AddHabitCubit({required AddHabit addHabit})
      : _addHabit = addHabit,
        super(const AddHabitState());

  final AddHabit _addHabit;

  Future<void> submit({
    required String name,
    required String description,
    required int points,
  }) async {
    if (state.status == AddHabitStatus.submitting) return;
    emit(state.copyWith(status: AddHabitStatus.submitting, errorMessage: null));

    final result = await _addHabit(
      AddHabitParams(name: name, description: description, points: points),
    );

    if (isClosed) return;
    result.match(
          (failure) => emit(
        state.copyWith(
          status: AddHabitStatus.failure,
          errorMessage: failure.message,
        ),
      ),
          (_) => emit(state.copyWith(status: AddHabitStatus.success)),
    );
  }
}
