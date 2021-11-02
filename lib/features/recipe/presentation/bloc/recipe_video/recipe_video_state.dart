part of 'recipe_video_bloc.dart';

abstract class RecipeVideoState extends Equatable {
  const RecipeVideoState();

  @override
  List<Object> get props => <Object>[];
}

class RecipeVideoInitial extends RecipeVideoState {
  @override
  List<Object> get props => <Object>[];
}

class RecipeVideoLoading extends RecipeVideoState {
  @override
  List<Object> get props => <Object>[];
}

class RecipeVideoLoaded extends RecipeVideoState {
  final List<RecipeVideo> videos;

  const RecipeVideoLoaded({required this.videos});

  @override
  List<Object> get props => <Object>[];
}

class RecipeVideoError extends RecipeVideoState {
  final String errorMessage;

  const RecipeVideoError({required this.errorMessage});
  @override
  List<Object> get props => <Object>[];
}
