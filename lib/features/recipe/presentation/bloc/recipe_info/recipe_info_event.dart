part of 'recipe_info_bloc.dart';

abstract class RecipeInfoEvent extends Equatable {
  const RecipeInfoEvent();

  @override
  List<Object?> get props => <Object?>[];
}

class GetRecipeInfoEvent extends RecipeInfoEvent {
  final int? recipeId;

  const GetRecipeInfoEvent({required this.recipeId});

  @override
  List<Object?> get props => <Object?>[recipeId];
}
