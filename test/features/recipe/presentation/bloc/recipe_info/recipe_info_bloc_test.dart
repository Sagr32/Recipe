import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:recipe/core/constants/constants.dart';
import 'package:recipe/core/error/failure.dart';
import 'package:recipe/core/usecase/usecase.dart';
import 'package:recipe/features/recipe/domain/usecases/get_recipe_information.dart';
import 'package:recipe/features/recipe/presentation/bloc/recipe_info/recipe_info_bloc.dart';

import '../../../../../test_constants.dart';

class MockRecipeInformationUsecase extends Mock
    implements GetRecipeInformation {}

void main() {
  late MockRecipeInformationUsecase mockUsecase;
  late RecipeInfoBloc bloc;

  setUp(() {
    mockUsecase = MockRecipeInformationUsecase();
    bloc = RecipeInfoBloc(usecase: mockUsecase);
  });

  group(
    'Recipe Info Bloc',
    () {
      test(
        'should verify that initial state is [RecipeInfoInitial]',
        () async {
          // assert
          expect(bloc.state, RecipeInfoInitial());
        },
      );

      test(
        'should call [GetRecipeInformation] use case',
        () async {
          // arrange
          when(() => mockUsecase(IntParams(recipeId: tRecipeId)))
              .thenAnswer((invocation) async => Right(tRecipe));
          // act
          bloc.add(GetRecipeInfoEvent(recipeId: tRecipeId));
          await untilCalled(() => mockUsecase(IntParams(recipeId: tRecipeId)));
          // assert
          verify(() => mockUsecase(IntParams(recipeId: tRecipeId)));
        },
      );

      blocTest<RecipeInfoBloc, RecipeInfoState>(
        '''should emits [RecipeInfoLoading,RecipeInfoLoaded]
         when calling usecase then call is successful''',
        // arange
        setUp: () {
          when(() => mockUsecase(IntParams(recipeId: tRecipeId)))
              .thenAnswer((invocation) async => Right(tRecipe));
        },
        build: () => bloc,
        // act
        act: (bloc) => bloc.add(GetRecipeInfoEvent(recipeId: tRecipeId)),
        // assert
        expect: () => <RecipeInfoState>[
          RecipeInfoLoading(),
          RecipeInfoLoaded(recipe: tRecipe),
        ],
        verify: (_) =>
            verify(() => mockUsecase(IntParams(recipeId: tRecipeId))).called(1),
      );
      blocTest<RecipeInfoBloc, RecipeInfoState>(
        '''should emits [RecipeInfoLoading,RecipeInfoError]
         when  error occurs''',
        // arange
        setUp: () {
          when(() => mockUsecase(IntParams(recipeId: tRecipeId))).thenAnswer(
              (invocation) async =>
                  Left(ServerFailure(errorMessage: kErrorMessage)));
        },
        build: () => bloc,
        // act
        act: (bloc) => bloc.add(GetRecipeInfoEvent(recipeId: tRecipeId)),
        // assert
        expect: () => <RecipeInfoState>[
          RecipeInfoLoading(),
          const RecipeInfoError(errorMessage: kErrorMessage),
        ],
        verify: (_) =>
            verify(() => mockUsecase(IntParams(recipeId: tRecipeId))).called(1),
      );
      blocTest<RecipeInfoBloc, RecipeInfoState>(
        '''should emits [RecipeInfoLoading,RecipeInfoError]
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
        act: (bloc) => bloc.add(GetRecipeInfoEvent(recipeId: tRecipeId)),
        // assert
        expect: () => <RecipeInfoState>[
          RecipeInfoLoading(),
          const RecipeInfoError(errorMessage: kNoConnectionError),
        ],
        verify: (_) =>
            verify(() => mockUsecase(IntParams(recipeId: tRecipeId))).called(1),
      );
    },
  );
}
