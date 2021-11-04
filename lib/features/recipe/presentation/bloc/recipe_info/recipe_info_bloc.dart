import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../domain/entities/recipe.dart';
import '../../../domain/usecases/get_recipe_information.dart';

part 'recipe_info_event.dart';
part 'recipe_info_state.dart';

class RecipeInfoBloc extends Bloc<RecipeInfoEvent, RecipeInfoState> {
  final GetRecipeInformation usecase;
  RecipeInfoBloc({required this.usecase}) : super(RecipeInfoInitial()) {
    on<GetRecipeInfoEvent>((event, emit) async {
      emit(RecipeInfoLoading());

      final Either<Failure, Recipe> failureOrRecipeInfo =
          await usecase(IntParams(recipeId: event.recipeId));

      failureOrRecipeInfo.fold(
        (Failure failure) => emit(
          RecipeInfoError(errorMessage: mapFailureToMessage(failure)),
        ),
        (recipe) => emit(
          RecipeInfoLoaded(recipe: recipe),
        ),
      );
    });
  }
}
