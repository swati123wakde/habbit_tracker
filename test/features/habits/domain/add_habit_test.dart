import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:habbit_tracker/core/error/failures.dart';
import 'package:habbit_tracker/features/domain/entities/daily_habit.dart';
import 'package:habbit_tracker/features/domain/entities/habit_detail.dart';
import 'package:habbit_tracker/features/domain/repositories/habit_repository.dart';
import 'package:habbit_tracker/features/domain/usecases/add_habit.dart';


class _FakeRepository implements HabitRepository {
  final added = <(String, String, int)>[];

  @override
  Future<Either<Failure, Unit>> addHabit({
    required String name,
    required String description,
    required int points,
  }) async {
    added.add((name, description, points));
    return const Right(unit);
  }

  @override
  Future<Either<Failure, Unit>> deleteHabit(String habitId) =>
      throw UnimplementedError();

  @override
  Future<Either<Failure, Unit>> setCompletion({
    required String habitId,
    required DateTime day,
    required bool isDone,
  }) =>
      throw UnimplementedError();

  @override
  Stream<Either<Failure, HabitDetail>> watchHabitDetail(
      String habitId, {
        required DateTime today,
        int days = 7,
      }) =>
      throw UnimplementedError();

  @override
  Stream<Either<Failure, List<DailyHabit>>> watchHabitsForDay(DateTime day) =>
      throw UnimplementedError();
}

void main() {
  late _FakeRepository repo;
  late AddHabit addHabit;

  setUp(() {
    repo = _FakeRepository();
    addHabit = AddHabit(repo);
  });

  test('trims input and saves a valid habit', () async {
    final result = await addHabit(
      const AddHabitParams(name: '  Read 20 pages ', description: ' ', points: 20),
    );
    expect(result.isRight(), isTrue);
    expect(repo.added.single, ('Read 20 pages', '', 20));
  });

  test('rejects an empty name', () async {
    final result = await addHabit(
      const AddHabitParams(name: '   ', description: '', points: 10),
    );
    expect(result.getLeft().toNullable(), isA<ValidationFailure>());
    expect(repo.added, isEmpty);
  });

  test('rejects points outside 1–100', () async {
    final result = await addHabit(
      const AddHabitParams(name: 'Exercise', description: '', points: 0),
    );
    expect(result.getLeft().toNullable(), isA<ValidationFailure>());
  });
}
