import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failure.dart';

/// abstract usecase class
/// that take params and return [Type]
abstract class UseCase<Type, Params> {
  /// call usecase
  Future<Either<Failure, Type>> call(Params params);
}

/// passs no parameter to usecase class
class NoParams extends Equatable {
  @override
  List<Object?> get props => <Object>[];
}

/// Custom String parameter to pass in use case
class StringParams extends Equatable {
  /// constructor
  const StringParams({
    this.query,
  });

  /// query search word
  final String? query;

  @override
  List<Object?> get props => <Object?>[
        query,
      ];
}

/// Custom Int parameter to pass in use case
class IntParams extends Equatable {
  /// constructor
  const IntParams({required this.recipeId});

  /// target recipe id
  final int? recipeId;

  @override
  List<Object?> get props => <Object?>[recipeId];
}
