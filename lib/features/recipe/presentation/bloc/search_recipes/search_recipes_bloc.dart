import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:recipe/core/error/failure.dart';
import 'package:recipe/core/usecase/usecase.dart';
import 'package:recipe/features/recipe/domain/entities/recipe.dart';
import 'package:recipe/features/recipe/domain/usecases/search_recipes.dart';

part 'search_recipes_event.dart';
part 'search_recipes_state.dart';

class SearchRecipesBloc extends Bloc<SearchRecipesEvent, SearchRecipesState> {
  final SearchRecipes usecase;

  SearchRecipesBloc(this.usecase) : super(SearchRecipesInitial()) {
    on<GetRecipesForSearchEvent>((event, emit) async {
      emit(SearchRecipesLoading());

      final Either<Failure, List<Recipe>> failureOrRecipes =
          await usecase(StringParams(query: event.query));

      failureOrRecipes.fold(
        (Failure failure) => emit(
          SearchRecipesError(errorMessage: mapFailureToMessage(failure)),
        ),
        (recipes) => emit(
          SearchRecipesLoaded(recipes: recipes),
        ),
      );
    });
  }
}
