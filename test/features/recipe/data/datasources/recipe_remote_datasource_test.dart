import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;
import 'package:recipe/core/constants/constants.dart';
import 'package:recipe/core/constants/endpoint.dart';
import 'package:recipe/core/error/exception.dart';
import 'package:recipe/features/recipe/data/datasources/recipe_remote_datasource.dart';

import '../../../../fixture/fixture_reader.dart';
import '../../../../test_constants.dart';

class MockHttpClient extends Mock implements http.Client {}

Matcher uriStartsWith(String value) {
  return isA<Uri>().having(
    (Uri uri) => uri.toString(),
    'uri',
    startsWith(value),
  );
}

class FakeUri extends Fake implements Uri {}

void main() {
  late MockHttpClient httpClient;
  late RecipeRemoteDataSourceImpl dataSourceImpl;

  setUp(() {
    httpClient = MockHttpClient();
    dataSourceImpl = RecipeRemoteDataSourceImpl(httpClient);
    registerFallbackValue(FakeUri());
  });

  void setUpMockHttpClientSuccess200(String fileName) async {
    when(
      () => httpClient.get(
        any(
          that: uriStartsWith('https'),
        ),
      ),
    ).thenAnswer(
      (_) async => http.Response(
        await fixture(fileName: fileName),
        200,
      ),
    );
  }

  void setUpMockHttpClientFailure404() {
    when(
      () => httpClient.get(
        any(
          that: uriStartsWith('https'),
        ),
      ),
    ).thenAnswer((_) async => http.Response('Something went wrong', 404));
  }

  group(
    'Get Recipe Information',
    () {
      final Map<String, String> queryParameters = {'apiKey': kApiKey};
      final Uri uri =
          Uri.https(kBaseUrl, kRecipeInfoEndpoint(tRecipeId), queryParameters);

      test(
        'should perform a GET request on Uri',
        () async {
          // arrange
          setUpMockHttpClientSuccess200('info');

          // act
          dataSourceImpl.getRecipeInformation(recipeId: tRecipeId);

          // assert
          verify(
            () => httpClient.get(uri),
          );
        },
      );

      test(
        'should return Recipe when response code is 200',
        () async {
          // arrange
          setUpMockHttpClientSuccess200('info');
          // act
          final result =
              await dataSourceImpl.getRecipeInformation(recipeId: tRecipeId);
          // assert
          expect(result, tRecipeModelList[0]);
        },
      );

      test(
        'should return Server Exception when response code 404 (failed)',
        () async {
          // arrange
          setUpMockHttpClientFailure404();
          // act
          final call = dataSourceImpl.getRecipeInformation(recipeId: tRecipeId);
          // assert
          expect(() => call, throwsA(const TypeMatcher<ServerException>()));
        },
      );
    },
  );

  group('Get Random Recipes', () {
    final Map<String, String> queryParameters = {'apiKey': kApiKey};
    final Uri uri =
        Uri.https(kBaseUrl, kRandomRecipesEndpoint, queryParameters);
    test(
      'should perform a GET request on Uri ',
      () async {
        // arrange
        setUpMockHttpClientSuccess200('random');
        // act
        dataSourceImpl.getRandomRecipes();

        // assert
        verify(
          () => httpClient.get(uri),
        );
      },
    );
    test(
      'should return a List of Recipe when response code is 200',
      () async {
        // arrange
        setUpMockHttpClientSuccess200('random');
        // act
        final result = await dataSourceImpl.getRandomRecipes();
        // assert
        expect(result, tRecipeModelList);
      },
    );
    test(
      'should return Server Exception when response code 404 (failed)',
      () async {
        // arrange
        setUpMockHttpClientFailure404();
        // act
        final call = dataSourceImpl.getRandomRecipes();
        // assert
        expect(() => call, throwsA(const TypeMatcher<ServerException>()));
      },
    );
  });

  group('Get Similar Recipe', () {
    final queryParameters = <String, dynamic>{
      'apiKey': kApiKey,
    };
    final Uri uri = Uri.https(
        kBaseUrl, kSimilarRecipesEndpoint(tRecipeId), queryParameters);
    test(
      'should perform a GET request on Uri ',
      () async {
        // arrange
        setUpMockHttpClientSuccess200('similar');
        // act
        dataSourceImpl.getSimilarRecipes(recipeId: tRecipeId);

        // assert
        verify(
          () => httpClient.get(uri),
        );
      },
    );
    test(
      'should return list of Recipe when response code is 200',
      () async {
        // arrange
        setUpMockHttpClientSuccess200('similar');
        // act
        final result =
            await dataSourceImpl.getSimilarRecipes(recipeId: tRecipeId);
        // assert
        expect(result, tRecipeModelList);
      },
    );
    test(
      'should return Server Exception when response code 404 (failed)',
      () async {
        // arrange
        setUpMockHttpClientFailure404();
        // act
        final call = dataSourceImpl.getSimilarRecipes(recipeId: tRecipeId);
        // assert
        expect(() => call, throwsA(const TypeMatcher<ServerException>()));
      },
    );
  });

  group('Search Recipes', () {
    final queryParameters = <String, dynamic>{
      'apiKey': kApiKey,
      'query': tQuery,
    };
    final Uri uri =
        Uri.https(kBaseUrl, kSearchRecipesEndpojnt, queryParameters);

    test(
      'should perform a GET request on Uri ',
      () async {
        // arrange
        setUpMockHttpClientSuccess200('search');
        // act
        dataSourceImpl.searchRecipes(query: tQuery);

        // assert
        verify(
          () => httpClient.get(uri),
        );
      },
    );

    test(
      'should retrun list of Recipe when response code is 200',
      () async {
        // arrange
        setUpMockHttpClientSuccess200('search');
        // act
        final result = await dataSourceImpl.searchRecipes(query: tQuery);
        // assert
        expect(result, tRecipeModelList);
      },
    );
    test(
      'should return Server Exception when response code 404 (failed)',
      () async {
        // arrange
        setUpMockHttpClientFailure404();
        // act
        final call = dataSourceImpl.searchRecipes(query: tQuery);
        // assert
        expect(() => call, throwsA(const TypeMatcher<ServerException>()));
      },
    );
  });
}
