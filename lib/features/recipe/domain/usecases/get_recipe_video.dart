import 'package:dartz/dartz.dart';
import 'package:recipe/core/error/failure.dart';
import 'package:recipe/core/usecase/usecase.dart';
import 'package:recipe/features/recipe/domain/entities/recipe_video.dart';
import 'package:recipe/features/recipe/domain/repositories/recipe_repository.dart';

/// get video for recipe using query

class GetRecipeVideo implements UseCase<List<RecipeVideo>, StringParams> {
  /// constructor
  GetRecipeVideo(this.recipeReposity);

  /// recipe repository
  final RecipeRepository recipeReposity;

  @override
  Future<Either<Failure, List<RecipeVideo>>> call(StringParams params) async {
    return await recipeReposity.getRecipesVideo(query: params.query);
  }
}
