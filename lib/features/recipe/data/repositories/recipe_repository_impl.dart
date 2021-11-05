import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/recipe.dart';
import '../../domain/entities/recipe_video.dart';
import '../../domain/repositories/recipe_repository.dart';
import '../datasources/recipe_remote_datasource.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final NetworkInfo networkInfo;

  /// Constructor
  RecipeRepositoryImpl(
      {required this.recipeRemoteDataSource, required this.networkInfo});

  /// Recipe remote data source
  final RecipeRemoteDataSource recipeRemoteDataSource;

  @override
  Future<Either<Failure, List<Recipe>>> getRandomRecipes() async {
    return await _getRecipes(
      () => recipeRemoteDataSource.getRandomRecipes(),
    );
  }

  @override
  Future<Either<Failure, List<Recipe>>> getSimilarRecipes(
      {required int? recipeId}) async {
    return await _getRecipes(
      () => recipeRemoteDataSource.getSimilarRecipes(
        recipeId: recipeId,
      ),
    );
  }

  @override
  Future<Either<Failure, List<Recipe>>> searchRecipes(
      {required String? query}) async {
    return await _getRecipes(
      () => recipeRemoteDataSource.searchRecipes(query: query),
    );
  }

  @override
  Future<Either<Failure, Recipe>> getRecipeInformation(
      {required int? recipeId}) async {
    if (await networkInfo.isConnected) {
      try {
        final Recipe remoteRecipes = await recipeRemoteDataSource
            .getRecipeInformation(recipeId: recipeId);

        return Right(remoteRecipes);
      } on ServerException catch (error) {
        return Left(
          ServerFailure(errorMessage: error.errorMessage.toString()),
        );
      }
    } else {
      return Left(
        ConnectionFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, List<RecipeVideo>>> getRecipesVideo(
      {required String? query}) async {
    if (await networkInfo.isConnected) {
      try {
        final List<RecipeVideo> remoteRecipes =
            await recipeRemoteDataSource.getRecipeVideo(query: query);

        return Right(remoteRecipes);
      } on ServerException catch (error) {
        return Left(
          ServerFailure(errorMessage: error.errorMessage.toString()),
        );
      }
    } else {
      return Left(
        ConnectionFailure(),
      );
    }
  }

  /// A function that takes a Future Future<List<Recipe>>
  /// and return Either Failure or List of Recipe
  Future<Either<Failure, List<Recipe>>> _getRecipes(
    Future<List<Recipe>> Function() chooserFunc,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final List<Recipe> remoteRecipes = await chooserFunc();

        return Right(remoteRecipes);
      } on ServerException catch (error) {
        return Left(
          ServerFailure(errorMessage: error.errorMessage.toString()),
        );
      }
    } else {
      return Left(
        ConnectionFailure(),
      );
    }
  }
}
