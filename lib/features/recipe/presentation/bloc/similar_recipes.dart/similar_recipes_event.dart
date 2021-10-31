part of 'similar_recipes_bloc.dart';

abstract class SimilarRecipesEvent extends Equatable {
  const SimilarRecipesEvent();

  @override
  List<Object> get props => <Object>[];
}

class GetSimilarRecipesEvent extends SimilarRecipesEvent {
  final int recipeId;

  const GetSimilarRecipesEvent({required this.recipeId});

  @override
  List<Object> get props => <Object>[];
}
