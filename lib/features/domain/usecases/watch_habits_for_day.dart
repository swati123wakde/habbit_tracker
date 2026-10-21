import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/daily_habit.dart';
import '../repositories/habit_repository.dart';

class WatchHabitsForDay implements StreamUseCase<List<DailyHabit>, DateTime> {
  const WatchHabitsForDay(this._repository);

  final HabitRepository _repository;

  @override
  Stream<Either<Failure, List<DailyHabit>>> call(DateTime day) =>
      _repository.watchHabitsForDay(day);
}
