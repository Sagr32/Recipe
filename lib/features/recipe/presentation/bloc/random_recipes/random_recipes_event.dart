part of 'random_recipes_bloc.dart';

///Random Recipe bloc event abstract class
abstract class RandomRecipesEvent extends Equatable {
  /// constructor
  const RandomRecipesEvent();

  @override
  List<Object> get props => <Object>[];
}

/// Event to get Recipes for random
class GetRecipesForRandomEvent extends RandomRecipesEvent {
  @override
  List<Object> get props => <Object>[];
}
