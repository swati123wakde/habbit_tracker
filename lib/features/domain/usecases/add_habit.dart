import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/habit_repository.dart';

class AddHabitParams {
  const AddHabitParams({
    required this.name,
    required this.description,
    required this.points,
  });

  final String name;
  final String description;
  final int points;
}

/// Validates business rules before persisting a new habit.
class AddHabit implements UseCase<Unit, AddHabitParams> {
  const AddHabit(this._repository);

  static const maxNameLength = 60;
  static const maxDescriptionLength = 200;
  static const minPoints = 1;
  static const maxPoints = 100;

  final HabitRepository _repository;

  @override
  Future<Either<Failure, Unit>> call(AddHabitParams params) async {
    final name = params.name.trim();
    final description = params.description.trim();

    if (name.isEmpty) {
      return const Left(Failure.validation('Habit name is required.'));
    }
    if (name.length > maxNameLength) {
      return const Left(
        Failure.validation('Name must be $maxNameLength characters or fewer.'),
      );
    }
    if (description.length > maxDescriptionLength) {
      return const Left(
        Failure.validation(
          'Description must be $maxDescriptionLength characters or fewer.',
        ),
      );
    }
    if (params.points < minPoints || params.points > maxPoints) {
      return const Left(
        Failure.validation('Points must be between $minPoints and $maxPoints.'),
      );
    }

    return _repository.addHabit(
      name: name,
      description: description,
      points: params.points,
    );
  }
}
