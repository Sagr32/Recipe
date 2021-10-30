part of 'recipe_info_bloc.dart';

abstract class RecipeInfoState extends Equatable {
  const RecipeInfoState();
  
  @override
  List<Object> get props => [];
}

class RecipeInfoInitial extends RecipeInfoState {}
