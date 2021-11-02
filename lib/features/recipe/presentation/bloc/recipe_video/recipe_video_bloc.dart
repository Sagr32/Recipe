import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:recipe/core/error/failure.dart';
import 'package:recipe/core/usecase/usecase.dart';
import 'package:recipe/features/recipe/domain/entities/recipe_video.dart';
import 'package:recipe/features/recipe/domain/usecases/get_recipe_video.dart';

part 'recipe_video_event.dart';
part 'recipe_video_state.dart';

class RecipeVideoBloc extends Bloc<RecipeVideoEvent, RecipeVideoState> {
  final GetRecipeVideo usecase;
  RecipeVideoBloc(this.usecase) : super(RecipeVideoInitial()) {
    on<GetRecipeVideoEvent>((event, emit) async {
      emit(RecipeVideoLoading());

      final Either<Failure, List<RecipeVideo>> failureOrRecipes =
          await usecase(StringParams(query: event.query));

      failureOrRecipes.fold(
        (Failure failure) => emit(
          RecipeVideoError(errorMessage: mapFailureToMessage(failure)),
        ),
        (videos) => emit(
          RecipeVideoLoaded(videos: videos),
        ),
      );
    });
  }
}
