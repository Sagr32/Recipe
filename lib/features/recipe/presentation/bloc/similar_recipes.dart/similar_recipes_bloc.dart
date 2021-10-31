import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:recipe/core/error/failure.dart';
import 'package:recipe/core/usecase/usecase.dart';
import 'package:recipe/features/recipe/domain/entities/recipe.dart';
import 'package:recipe/features/recipe/domain/usecases/get_similar_recipes.dart';

part 'similar_recipes_event.dart';
part 'similar_recipes_state.dart';

class SimilarRecipesBloc
    extends Bloc<SimilarRecipesEvent, SimilarRecipesState> {
  final GetSimilarRecipes usecase;
  SimilarRecipesBloc(this.usecase) : super(SimilarRecipesInitial()) {
    on<GetSimilarRecipesEvent>((event, emit) async {
      emit(SimilarRecipesLoading());

      final Either<Failure, List<Recipe>> failureOrRecipes =
          await usecase(IntParams(recipeId: event.recipeId));

      failureOrRecipes.fold(
        (Failure failure) => emit(
          SimilarRecipesError(errorMessage: mapFailureToMessage(failure)),
        ),
        (recipes) => emit(
          SimilarRecipesLoaded(recipes: recipes),
        ),
      );
    });
  }
}
