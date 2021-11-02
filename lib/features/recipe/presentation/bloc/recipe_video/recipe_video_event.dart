part of 'recipe_video_bloc.dart';

abstract class RecipeVideoEvent extends Equatable {
  const RecipeVideoEvent();

  @override
  List<Object> get props => [];
}

class GetRecipeVideoEvent extends RecipeVideoEvent {
  const GetRecipeVideoEvent({required this.query});

  final String query;

  @override
  List<Object> get props => [];
}
