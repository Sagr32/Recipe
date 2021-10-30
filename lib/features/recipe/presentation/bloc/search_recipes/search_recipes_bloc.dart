import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_recipes_event.dart';
part 'search_recipes_state.dart';

class SearchRecipesBloc extends Bloc<SearchRecipesEvent, SearchRecipesState> {
  SearchRecipesBloc() : super(SearchRecipesInitial()) {
    on<SearchRecipesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
