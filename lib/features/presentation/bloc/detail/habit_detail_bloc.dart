import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/utils/day_utils.dart';
import '../../../domain/entities/habit_detail.dart';
import '../../../domain/usecases/delete_habit.dart';
import '../../../domain/usecases/set_habit_completion.dart';
import '../../../domain/usecases/watch_habit_detail.dart';
part 'habit_detail_bloc.freezed.dart';   // ← add this

part 'habit_detail_event.dart';
part 'habit_detail_state.dart';

class HabitDetailBloc extends Bloc<HabitDetailEvent, HabitDetailState> {
  HabitDetailBloc({
    required WatchHabitDetail watchHabitDetail,
    required SetHabitCompletion setHabitCompletion,
    required DeleteHabit deleteHabit,
    DateTime Function()? clock,
  })  : _watchHabitDetail = watchHabitDetail,
        _setHabitCompletion = setHabitCompletion,
        _deleteHabit = deleteHabit,
        _clock = clock ?? DateTime.now,
        super(const HabitDetailState()) {
    on<HabitDetailStarted>(_onStarted);
    on<_HabitDetailUpdated>(_onUpdated);
    on<HabitDetailTodayToggled>(_onTodayToggled);
    on<HabitDetailDeleteRequested>(_onDeleteRequested);
  }

  final WatchHabitDetail _watchHabitDetail;
  final SetHabitCompletion _setHabitCompletion;
  final DeleteHabit _deleteHabit;
  final DateTime Function() _clock;
  StreamSubscription<Either<Failure, HabitDetail>>? _subscription;

  Future<void> _onStarted(
      HabitDetailStarted event,
      Emitter<HabitDetailState> emit,
      ) async {
    await _subscription?.cancel();
    final today = DayUtils.dateOnly(_clock());
    emit(
      state.copyWith(
        status: HabitDetailStatus.loading,
        habitId: event.habitId,
        today: today,
        errorMessage: null,
      ),
    );
    _subscription = _watchHabitDetail(
      WatchHabitDetailParams(habitId: event.habitId, today: today),
    ).listen((result) => add(HabitDetailEvent.updated(result)));
  }

  void _onUpdated(_HabitDetailUpdated event, Emitter<HabitDetailState> emit) {
    // After deletion the live stream reports "not found"; ignore it.
    if (state.status == HabitDetailStatus.deleted || state.isDeleting) return;
    event.result.fold(
          (failure) => emit(
        state.copyWith(
          status: HabitDetailStatus.failure,
          errorMessage: failure.message,
        ),
      ),
          (detail) => emit(
        state.copyWith(
          status: HabitDetailStatus.success,
          detail: detail,
          errorMessage: null,
        ),
      ),
    );
  }

  Future<void> _onTodayToggled(
      HabitDetailTodayToggled event,
      Emitter<HabitDetailState> emit,
      ) async {
    final detail = state.detail;
    if (detail == null || state.isUpdating) return;

    emit(state.copyWith(isUpdating: true, actionError: null));
    final result = await _setHabitCompletion(
      SetHabitCompletionParams(
        habitId: detail.habit.id,
        day: state.today ?? DayUtils.dateOnly(_clock()),
        isDone: !detail.isDoneToday,
      ),
    );
    emit(
      state.copyWith(
        isUpdating: false,
        actionError: result.match((f) => f.message, (_) => null),
      ),
    );
  }

  Future<void> _onDeleteRequested(
      HabitDetailDeleteRequested event,
      Emitter<HabitDetailState> emit,
      ) async {
    final id = state.habitId;
    if (id == null || state.isDeleting) return;

    emit(state.copyWith(isDeleting: true, actionError: null));
    final result = await _deleteHabit(id);
    result.match(
          (failure) => emit(
        state.copyWith(isDeleting: false, actionError: failure.message),
      ),
          (_) {
        _subscription?.cancel();
        emit(
          state.copyWith(isDeleting: false, status: HabitDetailStatus.deleted),
        );
      },
    );
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
