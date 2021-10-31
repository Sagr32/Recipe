part of 'similar_recipes_bloc.dart';

abstract class SimilarRecipesState extends Equatable {
  const SimilarRecipesState();

  @override
  List<Object> get props => <Object>[];
}

class SimilarRecipesInitial extends SimilarRecipesState {
  @override
  List<Object> get props => <Object>[];
}

class SimilarRecipesLoading extends SimilarRecipesState {
  @override
  List<Object> get props => <Object>[];
}

class SimilarRecipesLoaded extends SimilarRecipesState {
  final List<Recipe> recipes;

  const SimilarRecipesLoaded({required this.recipes});

  @override
  List<Object> get props => <Object>[recipes];
}

class SimilarRecipesError extends SimilarRecipesState {
  final String errorMessage;

  const SimilarRecipesError({required this.errorMessage});

  @override
  List<Object> get props => <Object>[errorMessage];
}
