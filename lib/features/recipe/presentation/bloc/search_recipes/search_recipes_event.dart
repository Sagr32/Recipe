part of 'search_recipes_bloc.dart';

abstract class SearchRecipesEvent extends Equatable {
  const SearchRecipesEvent();

  @override
  List<Object> get props => <Object>[];
}

class GetRecipesForSearchEvent extends SearchRecipesEvent {
  final String query;
  const GetRecipesForSearchEvent({required this.query});

  @override
  List<Object> get props => <Object>[query];
}
