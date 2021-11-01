import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/constants/constants.dart';
import '../../../../core/constants/endpoint.dart';
import '../../../../core/error/exception.dart';
import '../models/recipe_model.dart';

/// Remote data source abstract class
abstract class RecipeRemoteDataSource {
  /// Calls the [baseUrl]/recipes/random?limitLicense=true  endpoint.
  ///
  /// Throws a [Exception] for errors .
  Future<List<RecipeModel>> getRandomRecipes();

  /// Calls the [baseUrl]/recipes/[recipeId]/similar?limitLicense=true  endpoint.
  ///
  /// Throws a [Exception] for errors .

  Future<List<RecipeModel>> getSimilarRecipes({required int? recipeId});

  /// Calls the [baseUrl]/recipes/complexSearch?query=[query]  endpoint.
  ///
  /// Throws a [Exception] for errors .
  Future<List<RecipeModel>> searchRecipes({required String? query});

  /// Calls the [baseUrl]/recipes/[recipeId]/information?includeNutrition=false  endpoint.
  ///
  /// Throws a [Exception] for errors .

  Future<RecipeModel> getRecipeInformation({required int? recipeId});
}

/// Reciepe remote data source implementaion
class RecipeRemoteDataSourceImpl implements RecipeRemoteDataSource {
  /// constructor
  RecipeRemoteDataSourceImpl(this.client);

  /// http client
  final http.Client client;

  @override
  Future<List<RecipeModel>> getRandomRecipes() async {
    return _getRecipesFromUrl(
      endPoint: kRandomRecipesEndpoint,
      jsonKey: 'recipes',
      queryParameters: <String, dynamic>{
        'apiKey': kApiKey,
      },
    );
  }

  @override
  Future<List<RecipeModel>> getSimilarRecipes({required int? recipeId}) {
    return _getRecipesFromUrl(
        endPoint: kSimilarRecipesEndpoint(recipeId),
        queryParameters: <String, dynamic>{
          'apiKey': kApiKey,
        },
        jsonKey: '');
  }

  @override
  Future<List<RecipeModel>> searchRecipes({required String? query}) {
    return _getRecipesFromUrl(
        endPoint: kSearchRecipesEndpojnt,
        queryParameters: <String, dynamic>{
          'apiKey': kApiKey,
          'query': '$query',
        },
        jsonKey: 'results');
  }

  @override
  Future<RecipeModel> getRecipeInformation({required int? recipeId}) async {
    final Map<String, String> queryParameters = {'apiKey': kApiKey};
    final Uri uri =
        Uri.https(kBaseUrl, kRecipeInfoEndpoint(recipeId), queryParameters);

    try {
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        return RecipeModel.fromJson(json.decode(response.body));
      } else {
        throw ServerException(errorMessage: response.body);
      }
    } on Exception catch (error) {
      throw ServerException(errorMessage: error.toString());
    }
  }

  Future<List<RecipeModel>> _getRecipesFromUrl(
      {required String endPoint,
      required Map<String, dynamic>? queryParameters,
      required String? jsonKey}) async {
    final uri = Uri.https(kBaseUrl, endPoint, queryParameters);

    try {
      final response = await client.get(uri);
      if (response.statusCode == 200) {
        if (jsonKey!.isEmpty) {
          final myList = (json.decode(response.body));

          final List<RecipeModel> list = myList
              .map<RecipeModel>((data) => RecipeModel.fromJson(data))
              .toList();

          return list;
        } else {
          final myList = (json.decode(response.body)[jsonKey]);
          final List<RecipeModel> list = myList
              .map<RecipeModel>((data) => RecipeModel.fromJson(data))
              .toList();

          return list;
        }
      } else {
        throw ServerException(errorMessage: response.body);
      }
    } on Exception catch (error) {
      throw ServerException(errorMessage: error.toString());
    }
  }
}
