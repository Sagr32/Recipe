import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/recipe.dart';

/// Recipe repository or contract
abstract class RecipeRepository {
  Future<Either<Failure, List<Recipe>>> getRandomRecipes();
  Future<Either<Failure, List<Recipe>>> getSimilarRecipes(
      {required int? recipeId});
  Future<Either<Failure, List<Recipe>>> searchRecipes({required String? query});
  Future<Either<Failure, Recipe>> getRecipeInformation(
      {required int? recipeId});
}
