import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/recipe.dart';
import '../repositories/recipe_repository.dart';

class SearchRecipes implements UseCase<List<Recipe>, Params> {
  SearchRecipes(this.recipeReposity);
  final RecipeRepository recipeReposity;
  @override
  Future<Either<Failure, List<Recipe>>> call(params) async {
    return await recipeReposity.searchRecipes(query: params.query);
  }
}
