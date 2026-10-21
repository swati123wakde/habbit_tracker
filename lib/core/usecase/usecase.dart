import 'package:fpdart/fpdart.dart';

import '../error/failures.dart';

/// One-shot use case (command or query).
abstract interface class UseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

/// Use case that exposes a live stream of results.
abstract interface class StreamUseCase<T, Params> {
  Stream<Either<Failure, T>> call(Params params);
}

class NoParams {
  const NoParams();
}
