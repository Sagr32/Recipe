import 'package:equatable/equatable.dart';

/// Failure class
abstract class Failure extends Equatable {
  @override
  List<Object> get props => <Object>[];
}

/// General failure
class ServerFailure extends Failure {
  /// Constructor
  ServerFailure();

  @override
  List<Object> get props => <Object>[];
}

/// Custom Failure for no internet connection
class ConnectionFailure extends Failure {
  /// constructor
  ConnectionFailure();
  @override
  List<Object> get props => <Object>[];
}
