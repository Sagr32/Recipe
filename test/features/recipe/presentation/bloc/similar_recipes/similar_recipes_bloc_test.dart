import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:recipe/core/constants/constants.dart';
import 'package:recipe/core/error/failure.dart';
import 'package:recipe/core/usecase/usecase.dart';
import 'package:recipe/features/recipe/domain/usecases/get_similar_recipes.dart';
import 'package:recipe/features/recipe/presentation/bloc/similar_recipes.dart/similar_recipes_bloc.dart';

import '../../../../../test_constants.dart';

class MockSimilarRecipesUsecase extends Mock implements GetSimilarRecipes {}

void main() {
  late MockSimilarRecipesUsecase mockUsecase;
  late SimilarRecipesBloc bloc;

  setUp(() {
    mockUsecase = MockSimilarRecipesUsecase();
    bloc = SimilarRecipesBloc(mockUsecase);
  });
  group(
    'Similar Recipes Bloc',
    () {
      test(
        'should verify that initial state is [SimilarRecipesInitial] ',
        () async {
          // assert
          expect(
            bloc.state,
            SimilarRecipesInitial(),
          );
        },
      );

      test(
        'should call [GetSimilarRecipes] use case',
        () async {
          // arrange
          when(() => mockUsecase(IntParams(recipeId: tRecipeId)))
              .thenAnswer((invocation) async => Right(tRecipesList));
          // act
          bloc.add(GetSimilarRecipesEvent(recipeId: tRecipeId));
          await untilCalled(() => mockUsecase(IntParams(recipeId: tRecipeId)));
          // assert
          verify(() => mockUsecase(IntParams(recipeId: tRecipeId)));
        },
      );

      blocTest<SimilarRecipesBloc, SimilarRecipesState>(
        '''should emits [SimilarRecipesLoading,SimilarRecipesLoaded]
         when calling usecase then call is successful''',
        // arange
        setUp: () {
          when(() => mockUsecase(IntParams(recipeId: tRecipeId)))
              .thenAnswer((invocation) async => Right(tRecipesList));
        },
        build: () => bloc,
        // act
        act: (bloc) => bloc.add(GetSimilarRecipesEvent(recipeId: tRecipeId)),
        // assert
        expect: () => <SimilarRecipesState>[
          SimilarRecipesLoading(),
          SimilarRecipesLoaded(recipes: tRecipesList),
        ],
        verify: (_) =>
            verify(() => mockUsecase(IntParams(recipeId: tRecipeId))).called(1),
      );
      blocTest<SimilarRecipesBloc, SimilarRecipesState>(
        '''should emits [SimilarRecipesLoading,SimilarRecipesError]
         when  error occurs''',
        // arange
        setUp: () {
          when(() => mockUsecase(IntParams(recipeId: tRecipeId))).thenAnswer(
              (invocation) async =>
                  Left(ServerFailure(errorMessage: kErrorMessage)));
        },
        build: () => bloc,
        // act
        act: (bloc) => bloc.add(GetSimilarRecipesEvent(recipeId: tRecipeId)),
        // assert
        expect: () => <SimilarRecipesState>[
          SimilarRecipesLoading(),
          const SimilarRecipesError(errorMessage: kErrorMessage),
        ],
        verify: (_) =>
            verify(() => mockUsecase(IntParams(recipeId: tRecipeId))).called(1),
      );
      blocTest<SimilarRecipesBloc, SimilarRecipesState>(
        '''should emits [SimilarRecipesLoading,SimilarRecipesError]
         when  there is no internet connection''',
        // arange
        setUp: () {
          when(() => mockUsecase(IntParams(recipeId: tRecipeId))).thenAnswer(
            (invocation) async => Left(
              ConnectionFailure(),
            ),
          );
        },
        build: () => bloc,
        // act
        act: (bloc) => bloc.add(GetSimilarRecipesEvent(recipeId: tRecipeId)),
        // assert
        expect: () => <SimilarRecipesState>[
          SimilarRecipesLoading(),
          const SimilarRecipesError(errorMessage: kNoConnectionError),
        ],
        verify: (_) =>
            verify(() => mockUsecase(IntParams(recipeId: tRecipeId))).called(1),
      );
    },
  );
}
