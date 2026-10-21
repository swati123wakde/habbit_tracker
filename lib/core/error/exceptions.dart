/// Exceptions are thrown by the data layer only and are converted to
/// [Failure]s by repositories before they reach the domain layer.
class ServerException implements Exception {
  const ServerException(this.message);
  final String message;

  @override
  String toString() => 'ServerException: $message';
}

class NotFoundException implements Exception {
  const NotFoundException(this.message);
  final String message;

  @override
  String toString() => 'NotFoundException: $message';
}
