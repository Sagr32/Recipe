import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/recipe.dart';
import '../repositories/recipe_repository.dart';

/// get specific recipe information use case

class GetRecipeInformation implements UseCase<Recipe, Params> {
  /// constructor
  GetRecipeInformation(this.recipeReposity);

  /// recipe repository
  final RecipeRepository recipeReposity;
  @override
  Future<Either<Failure, Recipe>> call(params) async {
    return await recipeReposity.getRecipeInformation(recipeId: params.recipeId);
  }
}
