part of 'recipe_info_bloc.dart';

abstract class RecipeInfoState extends Equatable {
  const RecipeInfoState();

  @override
  List<Object> get props => [];
}

class RecipeInfoInitial extends RecipeInfoState {}

@override
List<Object> get props => <Object>[];

class RecipeInfoLoading extends RecipeInfoState {
  @override
  List<Object> get props => <Object>[];
}

class RecipeInfoLoaded extends RecipeInfoState {
  final Recipe recipe;

  const RecipeInfoLoaded({required this.recipe});
  @override
  List<Object> get props => <Object>[];
}

class RecipeInfoError extends RecipeInfoState {
  final String errorMessage;

  const RecipeInfoError({required this.errorMessage});

  @override
  List<Object> get props => <Object>[];
}
