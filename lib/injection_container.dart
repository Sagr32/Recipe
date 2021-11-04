import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'features/recipe/data/repositories/recipe_repository_impl.dart';
import 'features/recipe/domain/usecases/get_random_recipes.dart';
import 'features/recipe/domain/usecases/get_recipe_video.dart';
import 'features/recipe/domain/usecases/get_similar_recipes.dart';
import 'features/recipe/domain/usecases/search_recipes.dart';
import 'features/recipe/presentation/bloc/random_recipes/random_recipes_bloc.dart';
import 'features/recipe/presentation/bloc/recipe_info/recipe_info_bloc.dart';
import 'features/recipe/presentation/bloc/recipe_video/recipe_video_bloc.dart';
import 'features/recipe/presentation/bloc/search_recipes/search_recipes_bloc.dart';
import 'features/recipe/presentation/bloc/similar_recipes.dart/similar_recipes_bloc.dart';

import 'core/network/network_info.dart';
import 'features/recipe/data/datasources/recipe_remote_datasource.dart';
import 'features/recipe/domain/repositories/recipe_repository.dart';
import 'features/recipe/domain/usecases/get_recipe_information.dart';
import 'package:http/http.dart' as http;

final GetIt sl = GetIt.instance;

void init() {
  //! Feature - Recipe

  //? Bloc
  sl.registerFactory<RecipeInfoBloc>(
    () => RecipeInfoBloc(
      usecase: sl(),
    ),
  );
  sl.registerFactory<RandomRecipesBloc>(
    () => RandomRecipesBloc(
      sl(),
    ),
  );
  sl.registerFactory<SimilarRecipesBloc>(
    () => SimilarRecipesBloc(
      sl(),
    ),
  );
  sl.registerFactory<SearchRecipesBloc>(
    () => SearchRecipesBloc(
      sl(),
    ),
  );
  sl.registerFactory<RecipeVideoBloc>(
    () => RecipeVideoBloc(
      sl(),
    ),
  );
  //? Use cases
  sl.registerLazySingleton<GetRecipeInformation>(
    () => GetRecipeInformation(
      sl(),
    ),
  );
  sl.registerLazySingleton<GetSimilarRecipes>(
    () => GetSimilarRecipes(
      sl(),
    ),
  );
  sl.registerLazySingleton<GetRandomRecipes>(
    () => GetRandomRecipes(
      sl(),
    ),
  );
  sl.registerLazySingleton<SearchRecipes>(
    () => SearchRecipes(
      sl(),
    ),
  );
  sl.registerLazySingleton<GetRecipeVideo>(
    () => GetRecipeVideo(
      sl(),
    ),
  );
//? Repository
  sl.registerLazySingleton<RecipeRepository>(
    () => RecipeRepositoryImpl(
      networkInfo: sl(),
      recipeRemoteDataSource: sl(),
    ),
  );

//? Data Source
  sl.registerLazySingleton<RecipeRemoteDataSource>(
    () => RecipeRemoteDataSourceImpl(
      sl(),
    ),
  );

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      sl(),
    ),
  );
  sl.registerLazySingleton(
    () => InternetConnectionChecker(),
  );

  //! External
  sl.registerLazySingleton(() => http.Client());
}
