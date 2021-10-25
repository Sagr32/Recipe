import 'package:equatable/equatable.dart';

/// Failure class
abstract class Failure extends Equatable {
  @override
  List<Object> get props => <Object>[];
}

/// General failures
class ServerFailure extends Failure {
  /// Constructor
  ServerFailure();

  @override
  List<Object> get props => <Object>[];
}
