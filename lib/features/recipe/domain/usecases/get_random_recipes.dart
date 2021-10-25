import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/recipe.dart';
import '../repositories/recipe_repository.dart';

/// get random recipes use case
class GetRandomRecipes implements UseCase<List<Recipe>, NoParams> {
  /// constructor
  GetRandomRecipes(this.recipeReposity);

  /// recipe repository
  final RecipeRepository recipeReposity;

  @override
  Future<Either<Failure, List<Recipe>>> call(params) async {
    return await recipeReposity.getRandomRecipes();
  }
}
