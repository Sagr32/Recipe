/// Custom exception
class ServerException implements Exception {
  /// Constructor
  ServerException({required this.errorMessage});

  /// a message describes error
  final String errorMessage;

  @override
  String toString() => '$errorMessage';
}
