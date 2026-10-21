/// Domain-level error type returned on the left side of an `Either`.
/// Plain Dart sealed class: no code generation needed, so `message`
/// is always available.
sealed class Failure {
  const Failure(this.message);

  final String message;

  const factory Failure.server(String message) = ServerFailure;
  const factory Failure.notFound(String message) = NotFoundFailure;
  const factory Failure.validation(String message) = ValidationFailure;

  @override
  bool operator ==(Object other) =>
      other.runtimeType == runtimeType &&
          other is Failure &&
          other.message == message;

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() => '$runtimeType($message)';
}

final class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

final class NotFoundFailure extends Failure {
  const NotFoundFailure(super.message);
}

final class ValidationFailure extends Failure {
  const ValidationFailure(super.message);
}