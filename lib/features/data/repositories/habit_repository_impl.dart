import 'dart:async';

import 'package:fpdart/fpdart.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/day_utils.dart';
import '../../../../core/utils/stream_combine.dart';
import '../../domain/entities/daily_habit.dart';
import '../../domain/entities/day_status.dart';
import '../../domain/entities/habit_detail.dart';
import '../../domain/repositories/habit_repository.dart';
import '../datasources/habit_remote_data_source.dart';
import '../models/habit_model.dart';

class HabitRepositoryImpl implements HabitRepository {
  const HabitRepositoryImpl(this._remote);

  final HabitRemoteDataSource _remote;

  @override
  Stream<Either<Failure, List<DailyHabit>>> watchHabitsForDay(DateTime day) {
    return combineLatest2(
      _remote.watchHabits(),
      _remote.watchCompletedHabitIds(DayUtils.dayKey(day)),
          (List<HabitModel> habits, Set<String> doneIds) => [
        for (final model in habits)
          DailyHabit(
            habit: model.toEntity(),
            isDone: doneIds.contains(model.id),
          ),
      ],
    ).transform(_toEither());
  }

  @override
  Stream<Either<Failure, HabitDetail>> watchHabitDetail(
      String habitId, {
        required DateTime today,
        int days = 7,
      }) {
    final window = DayUtils.lastDays(today, days);
    final keys = window.map(DayUtils.dayKey).toList();

    return combineLatest2(
      _remote.watchHabit(habitId),
      _remote.watchCompletedDays(habitId, keys),
          (HabitModel model, Set<String> doneKeys) => HabitDetail(
        habit: model.toEntity(),
        history: [
          for (final date in window)
            DayStatus(
              date: date,
              isDone: doneKeys.contains(DayUtils.dayKey(date)),
            ),
        ],
      ),
    ).transform(_toEither());
  }

  @override
  Future<Either<Failure, Unit>> addHabit({
    required String name,
    required String description,
    required int points,
  }) =>
      _guard(
            () => _remote.addHabit(
          HabitModel(
            id: '',
            name: name,
            description: description,
            points: points,
          ),
        ),
      );

  @override
  Future<Either<Failure, Unit>> setCompletion({
    required String habitId,
    required DateTime day,
    required bool isDone,
  }) =>
      _guard(
            () => _remote.setCompletion(
          habitId: habitId,
          dayKey: DayUtils.dayKey(day),
          isDone: isDone,
        ),
      );

  @override
  Future<Either<Failure, Unit>> deleteHabit(String habitId) =>
      _guard(() => _remote.deleteHabit(habitId));

  Future<Either<Failure, Unit>> _guard(Future<void> Function() action) async {
    try {
      await action();
      return const Right(unit);
    } catch (e) {
      return Left(_mapError(e));
    }
  }

  StreamTransformer<T, Either<Failure, T>> _toEither<T>() =>
      StreamTransformer<T, Either<Failure, T>>.fromHandlers(
        handleData: (data, sink) => sink.add(Right<Failure, T>(data)),
        handleError: (error, _, sink) =>
            sink.add(Left<Failure, T>(_mapError(error))),
      );

  Failure _mapError(Object error) => switch (error) {
    NotFoundException(:final message) => Failure.notFound(message),
    ServerException(:final message) => Failure.server(message),
    _ => Failure.server('Unexpected error: $error'),
  };
}
