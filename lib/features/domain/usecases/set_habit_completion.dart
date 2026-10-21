import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/habit_repository.dart';

class SetHabitCompletionParams {
  const SetHabitCompletionParams({
    required this.habitId,
    required this.day,
    required this.isDone,
  });

  final String habitId;
  final DateTime day;
  final bool isDone;
}

class SetHabitCompletion implements UseCase<Unit, SetHabitCompletionParams> {
  const SetHabitCompletion(this._repository);

  final HabitRepository _repository;

  @override
  Future<Either<Failure, Unit>> call(SetHabitCompletionParams params) =>
      _repository.setCompletion(
        habitId: params.habitId,
        day: params.day,
        isDone: params.isDone,
      );
}
