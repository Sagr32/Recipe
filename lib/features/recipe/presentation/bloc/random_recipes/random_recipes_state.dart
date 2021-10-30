part of 'random_recipes_bloc.dart';

/// Random Recipe bloc state abstract class
abstract class RandomRecipesState extends Equatable {
  /// constructor
  const RandomRecipesState();

  @override
  List<Object> get props => <Object>[];
}

/// Random Recipes Initial state
class RandomRecipesInitial extends RandomRecipesState {}

/// Random Recipes Loading state
class RandomRecipesLoading extends RandomRecipesState {}

/// Random Recipes Loaded state
class RandomRecipesLoaded extends RandomRecipesState {
  /// constructor
  const RandomRecipesLoaded({required this.recipes});

  /// list of Recipe
  final List<Recipe> recipes;

  @override
  List<Object> get props => <Object>[recipes];
}

/// Random Recipes Error state
class RandomRecipesError extends RandomRecipesState {
  /// constructor
  const RandomRecipesError({required this.errorMessage});

  /// error message to display
  final String errorMessage;

  @override
  List<Object> get props => <Object>[errorMessage];
}
