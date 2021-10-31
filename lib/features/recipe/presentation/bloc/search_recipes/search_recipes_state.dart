part of 'search_recipes_bloc.dart';

abstract class SearchRecipesState extends Equatable {
  const SearchRecipesState();

  @override
  List<Object> get props => <Object>[];
}

class SearchRecipesInitial extends SearchRecipesState {
  @override
  List<Object> get props => <Object>[];
}

class SearchRecipesLoading extends SearchRecipesState {
  @override
  List<Object> get props => <Object>[];
}

class SearchRecipesLoaded extends SearchRecipesState {
  final List<Recipe> recipes;

  const SearchRecipesLoaded({required this.recipes});

  @override
  List<Object> get props => <Object>[];
}

class SearchRecipesError extends SearchRecipesState {
  final String errorMessage;

  const SearchRecipesError({required this.errorMessage});

  @override
  List<Object> get props => <Object>[];
}
