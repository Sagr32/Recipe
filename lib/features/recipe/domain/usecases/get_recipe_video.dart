import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/recipe_video.dart';
import '../repositories/recipe_repository.dart';

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
