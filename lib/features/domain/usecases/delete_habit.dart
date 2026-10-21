import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/habit_repository.dart';

class DeleteHabit implements UseCase<Unit, String> {
  const DeleteHabit(this._repository);

  final HabitRepository _repository;

  @override
  Future<Either<Failure, Unit>> call(String habitId) =>
      _repository.deleteHabit(habitId);
}
