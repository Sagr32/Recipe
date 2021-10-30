import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../domain/entities/recipe.dart';
import '../../../domain/usecases/get_random_recipes.dart';

part 'random_recipes_event.dart';
part 'random_recipes_state.dart';

/// Random Recipes Bloc
class RandomRecipesBloc extends Bloc<RandomRecipesEvent, RandomRecipesState> {
  /// Constructor
  RandomRecipesBloc(this.usecase) : super(RandomRecipesInitial()) {
    on<GetRecipesForRandomEvent>(_onRandomRecipesCalled);
  }

  /// Get Random Recipes use case
  final GetRandomRecipes usecase;

  /// function that fires when receiving [GetRecipesForRandom] event
  /// from ui
  void _onRandomRecipesCalled(
      GetRecipesForRandomEvent event, Emitter<RandomRecipesState> emit) async {
    emit(RandomRecipesLoading());
    final Either<Failure, List<Recipe>> failureOrRandomRecipes =
        await usecase(NoParams());
    failureOrRandomRecipes.fold(
      (Failure failure) => emit(
        RandomRecipesError(errorMessage: mapFailureToMessage(failure)),
      ),
      (recipes) => emit(
        RandomRecipesLoaded(recipes: recipes),
      ),
    );
  }
}
