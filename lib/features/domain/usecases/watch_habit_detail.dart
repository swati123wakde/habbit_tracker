import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/habit_detail.dart';
import '../repositories/habit_repository.dart';

class WatchHabitDetailParams {
  const WatchHabitDetailParams({
    required this.habitId,
    required this.today,
    this.days = 7,
  });

  final String habitId;
  final DateTime today;
  final int days;
}

class WatchHabitDetail
    implements StreamUseCase<HabitDetail, WatchHabitDetailParams> {
  const WatchHabitDetail(this._repository);

  final HabitRepository _repository;

  @override
  Stream<Either<Failure, HabitDetail>> call(WatchHabitDetailParams params) =>
      _repository.watchHabitDetail(
        params.habitId,
        today: params.today,
        days: params.days,
      );
}
