part of 'search_recipes_bloc.dart';

abstract class SearchRecipesState extends Equatable {
  const SearchRecipesState();
  
  @override
  List<Object> get props => [];
}

class SearchRecipesInitial extends SearchRecipesState {}
