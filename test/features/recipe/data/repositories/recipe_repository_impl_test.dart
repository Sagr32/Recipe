import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:recipe/core/error/exception.dart';
import 'package:recipe/core/error/failure.dart';
import 'package:recipe/core/network/network_info.dart';
import 'package:recipe/features/recipe/data/datasources/recipe_remote_datasource.dart';
import 'package:recipe/features/recipe/data/repositories/recipe_repository_impl.dart';
import '../../../../test_constants.dart';

class MockRecipeRemoteDataSource extends Mock
    implements RecipeRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late MockRecipeRemoteDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;
  late RecipeRepositoryImpl repositoryImpl;
  setUp(
    () {
      mockRemoteDataSource = MockRecipeRemoteDataSource();
      mockNetworkInfo = MockNetworkInfo();
      repositoryImpl = RecipeRepositoryImpl(
        recipeRemoteDataSource: mockRemoteDataSource,
        networkInfo: mockNetworkInfo,
      );
    },
  );

  void runTestOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  void runTestOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      body();
    });
  }

  group('Get Random Recipes', () {
    runTestOnline(() {
      test(
        '''should return a list of RecipeModel when 
        calling datasource is successful''',
        () async {
          // arrange
          when(() => mockRemoteDataSource.getRandomRecipes())
              .thenAnswer((invocation) async => tRecipeModelList);
          // act
          final result = await repositoryImpl.getRandomRecipes();
          // assert
          expect(result, Right(tRecipeModelList));
        },
      );

      test(
        'should return server failure when calling datasource failed',
        () async {
          // arrange
          when(() => mockRemoteDataSource.getRandomRecipes())
              .thenThrow(ServerException());

          // act
          final result = await repositoryImpl.getRandomRecipes();

          // assert
          expect(result, Left(ServerFailure()));
        },
      );
    });
    runTestOffline(() {
      test(
        'should return Connection failure when the device is offline',
        () async {
          // arrange
          when(() => mockRemoteDataSource.getRandomRecipes())
              .thenThrow(ServerException());

          // act
          final result = await repositoryImpl.getRandomRecipes();

          // assert
          expect(result, Left(ConnectionFailure()));
        },
      );
    });
  });

  group('get Similar Recipes', () {
    runTestOnline(
      () {
        test(
          'should return a list of RecipeModel when calling datasource is successful',
          () async {
            // arrange
            when(() =>
                    mockRemoteDataSource.getSimilarRecipes(recipeId: tRecipeId))
                .thenAnswer((invocation) async => tRecipeModelList);
            // act
            final result =
                await repositoryImpl.getSimilarRecipes(recipeId: tRecipeId);
            // assert
            expect(result, Right(tRecipeModelList));
          },
        );
        test(
          'should return server failure when calling datasource failed',
          () async {
            // arrange
            when(() =>
                    mockRemoteDataSource.getSimilarRecipes(recipeId: tRecipeId))
                .thenThrow(ServerException());
            // act
            final result =
                await repositoryImpl.getSimilarRecipes(recipeId: tRecipeId);
            // assert
            expect(result, Left(ServerFailure()));
          },
        );
      },
    );
    runTestOffline(() {
      test(
        'should return connection failure when calling datasource failed',
        () async {
          // arrange
          when(() =>
                  mockRemoteDataSource.getSimilarRecipes(recipeId: tRecipeId))
              .thenThrow(ServerException());
          // act
          final result =
              await repositoryImpl.getSimilarRecipes(recipeId: tRecipeId);
          // assert
          expect(result, Left(ConnectionFailure()));
        },
      );
    });
  });

  group(
    'Search Recipes',
    () {
      runTestOnline(
        () {
          test(
            'should return a list of RecipeModel when calling datasource is successful',
            () async {
              // arrange
              when(() => mockRemoteDataSource.searchRecipes(query: tQuery))
                  .thenAnswer((invocation) async => tRecipeModelList);
              // act
              final result = await repositoryImpl.searchRecipes(query: tQuery);
              // assert
              expect(result, Right(tRecipeModelList));
            },
          );

          test(
            'should return server failure when calling datasource failed',
            () async {
              // arrange
              when(() => mockRemoteDataSource.searchRecipes(query: tQuery))
                  .thenThrow(ServerException());
              // act
              final result = await repositoryImpl.searchRecipes(query: tQuery);
              // assert
              expect(result, Left(ServerFailure()));
            },
          );
        },
      );
      runTestOffline(() {
        test(
          'should return connection failure when device is offline',
          () async {
            // arrange
            when(() => mockRemoteDataSource.searchRecipes(query: tQuery))
                .thenThrow(ServerException());
            // act
            final result = await repositoryImpl.searchRecipes(query: tQuery);
            // assert
            expect(result, Left(ConnectionFailure()));
          },
        );
      });
    },
  );
  group('get Recipe Information', () {
    runTestOnline(
      () {
        test(
          'should return Recipe model when calling datasource is successful',
          () async {
            // arrange
            when(() => mockRemoteDataSource.getRecipeInformation(
                    recipeId: tRecipeId))
                .thenAnswer((invocation) async => tRecipeModelList[0]);
            // act
            final result =
                await repositoryImpl.getRecipeInformation(recipeId: tRecipeId);
            // assert
            expect(result, Right(tRecipeModelList[0]));
          },
        );
        test(
          'should return server failure when calling datasource failed',
          () async {
            // arrange
            when(() => mockRemoteDataSource.getRecipeInformation(
                recipeId: tRecipeId)).thenThrow(ServerException());
            // act
            final result =
                await repositoryImpl.getRecipeInformation(recipeId: tRecipeId);
            // assert
            expect(result, Left(ServerFailure()));
          },
        );
      },
    );
    runTestOffline(() {
      test(
        'should return connection failure when calling datasource failed',
        () async {
          // arrange
          when(() => mockRemoteDataSource.getRecipeInformation(
              recipeId: tRecipeId)).thenThrow(ServerException());
          // act
          final result =
              await repositoryImpl.getRecipeInformation(recipeId: tRecipeId);
          // assert
          expect(result, Left(ConnectionFailure()));
        },
      );
    });
  });
}
