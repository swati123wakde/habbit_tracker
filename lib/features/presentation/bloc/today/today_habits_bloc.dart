import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/utils/day_utils.dart';
import '../../../domain/entities/daily_habit.dart';
import '../../../domain/usecases/set_habit_completion.dart';
import '../../../domain/usecases/watch_habits_for_day.dart';

part 'today_habits_bloc.freezed.dart';
part 'today_habits_event.dart';
part 'today_habits_state.dart';

class TodayHabitsBloc extends Bloc<TodayHabitsEvent, TodayHabitsState> {
  TodayHabitsBloc({
    required WatchHabitsForDay watchHabitsForDay,
    required SetHabitCompletion setHabitCompletion,
    DateTime Function()? clock,
  })  : _watchHabitsForDay = watchHabitsForDay,
        _setHabitCompletion = setHabitCompletion,
        _clock = clock ?? DateTime.now,
        super(const TodayHabitsState()) {
    on<TodayHabitsStarted>(_onStarted);
    on<TodayHabitsDayCheckRequested>(_onDayCheckRequested);
    on<_TodayHabitsUpdated>(_onUpdated);
    on<TodayHabitsToggled>(_onToggled);
  }

  final WatchHabitsForDay _watchHabitsForDay;
  final SetHabitCompletion _setHabitCompletion;
  final DateTime Function() _clock;
  StreamSubscription<Either<Failure, List<DailyHabit>>>? _subscription;

  Future<void> _onStarted(
      TodayHabitsStarted event,
      Emitter<TodayHabitsState> emit,
      ) async {
    await _subscription?.cancel();
    final today = DayUtils.dateOnly(_clock());
    emit(
      state.copyWith(
        status: state.habits.isEmpty
            ? TodayHabitsStatus.loading
            : state.status,
        day: today,
        errorMessage: null,
      ),
    );
    _subscription = _watchHabitsForDay(today)
        .listen((result) => add(TodayHabitsEvent.updated(result)));
  }

  /// Re-subscribes when the calendar day has changed (e.g. app resumed
  /// after midnight) so "today" is always correct.
  void _onDayCheckRequested(
      TodayHabitsDayCheckRequested event,
      Emitter<TodayHabitsState> emit,
      ) {
    final day = state.day;
    if (day == null || !DayUtils.isSameDay(day, _clock())) {
      add(const TodayHabitsEvent.started());
    }
  }

  void _onUpdated(_TodayHabitsUpdated event, Emitter<TodayHabitsState> emit) {
    event.result.fold(
          (failure) => emit(
        state.copyWith(
          status: TodayHabitsStatus.failure,
          errorMessage: failure.message,
        ),
      ),
          (habits) => emit(
        state.copyWith(
          status: TodayHabitsStatus.success,
          habits: habits,
          errorMessage: null,
        ),
      ),
    );
  }

  Future<void> _onToggled(
      TodayHabitsToggled event,
      Emitter<TodayHabitsState> emit,
      ) async {
    final day = state.day ?? DayUtils.dateOnly(_clock());
    emit(state.copyWith(actionError: null));
    // Firestore's latency compensation pushes the new value through the
    // live stream immediately, so no manual optimistic update is needed.
    final result = await _setHabitCompletion(
      SetHabitCompletionParams(
        habitId: event.item.habit.id,
        day: day,
        isDone: !event.item.isDone,
      ),
    );
    result.match(
          (failure) => emit(state.copyWith(actionError: failure.message)),
          (_) {},
    );
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
