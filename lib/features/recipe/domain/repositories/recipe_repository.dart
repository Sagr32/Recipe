import 'package:dartz/dartz.dart';
import '../entities/recipe_video.dart';

import '../../../../core/error/failure.dart';
import '../entities/recipe.dart';

/// Recipe repository or contract
abstract class RecipeRepository {
  /// used to get Random Recipes
  Future<Either<Failure, List<Recipe>>> getRandomRecipes();

  /// used to get Similar Recipes for a specific recipe
  Future<Either<Failure, List<Recipe>>> getSimilarRecipes(
      {required int? recipeId});

  /// used to search for a recipe
  Future<Either<Failure, List<Recipe>>> searchRecipes({required String? query});

  /// used to get recipe information
  Future<Either<Failure, Recipe>> getRecipeInformation(
      {required int? recipeId});

  /// used to get recipe video
  Future<Either<Failure, List<RecipeVideo>>> getRecipesVideo(
      {required String? query});
}
