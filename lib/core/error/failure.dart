import 'package:equatable/equatable.dart';

import '../constants/constants.dart';

/// Failure class
abstract class Failure extends Equatable {
  @override
  List<Object> get props => <Object>[];
}

/// General failure
class ServerFailure extends Failure {
  /// Constructor
  ServerFailure({required this.errorMessage});

  /// a meesage that describes error
  final String errorMessage;
  @override
  List<Object> get props => <Object>[errorMessage];
}

/// Custom Failure for no internet connection
class ConnectionFailure extends Failure {
  /// constructor
  ConnectionFailure();
  @override
  List<Object> get props => <Object>[];
}

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return failure.props[0].toString();
    case ConnectionFailure:
      return kNoConnectionError;
    default:
      return 'Unexpected error';
  }
}
