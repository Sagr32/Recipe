import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/recipe.dart';
import '../repositories/recipe_repository.dart';

/// get similar recipes use case

class GetSimilarRecipes implements UseCase<List<Recipe>, Params> {
  /// constructor
  GetSimilarRecipes(this.recipeReposity);
  final RecipeRepository recipeReposity;
  @override
  Future<Either<Failure, List<Recipe>>> call(params) async {
    return await recipeReposity.getSimilarRecipes(recipeId: params.recipeId);
  }
}
