import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:recipe/core/constants/constants.dart';
import 'package:recipe/core/error/failure.dart';
import 'package:recipe/core/usecase/usecase.dart';
import 'package:recipe/features/recipe/domain/usecases/get_random_recipes.dart';
import 'package:recipe/features/recipe/presentation/bloc/random_recipes/random_recipes_bloc.dart';

import '../../../../../test_constants.dart';

class MockGetRandomRecipes extends Mock implements GetRandomRecipes {}

void main() {
  late MockGetRandomRecipes mockUsecase;
  late RandomRecipesBloc bloc;

  setUp(
    () {
      mockUsecase = MockGetRandomRecipes();
      bloc = RandomRecipesBloc(mockUsecase);
    },
  );

  group(
    'Random Recipes Bloc',
    () {
      test(
        'should verify that initial state is [RandomRecipesInitial] ',
        () async {
          // assert
          expect(bloc.state, RandomRecipesInitial());
        },
      );

      test(
        'should call [GetRandomRecipes] use case',
        () async {
          // arrange
          when(() => mockUsecase(NoParams()))
              .thenAnswer((invocation) async => Right(tRecipesList));
          // act
          bloc.add(GetRecipesForRandomEvent());
          await untilCalled(() => mockUsecase(NoParams()));
          // assert
          verify(() => mockUsecase(NoParams()));
        },
      );

      blocTest<RandomRecipesBloc, RandomRecipesState>(
        '''should emits [RandomRecipesLoading,RandomRecipesLoaded]
         when calling usecase then call is successful''',
        // arange
        setUp: () {
          when(() => mockUsecase(NoParams()))
              .thenAnswer((invocation) async => Right(tRecipesList));
        },
        build: () => bloc,
        // act
        act: (bloc) => bloc.add(GetRecipesForRandomEvent()),
        // assert
        expect: () => <RandomRecipesState>[
          RandomRecipesLoading(),
          const RandomRecipesLoaded(recipes: tRecipesList),
        ],
        verify: (_) => verify(() => mockUsecase(NoParams())).called(1),
      );
      blocTest<RandomRecipesBloc, RandomRecipesState>(
        '''should emits [RandomRecipesLoading,RandomRecipesError]
         when  error occurs''',
        // arange
        setUp: () {
          when(() => mockUsecase(NoParams())).thenAnswer((invocation) async =>
              Left(ServerFailure(errorMessage: kErrorMessage)));
        },
        build: () => bloc,
        // act
        act: (bloc) => bloc.add(GetRecipesForRandomEvent()),
        // assert
        expect: () => <RandomRecipesState>[
          RandomRecipesLoading(),
          const RandomRecipesError(errorMessage: kErrorMessage),
        ],
        verify: (_) => verify(() => mockUsecase(NoParams())).called(1),
      );
      blocTest<RandomRecipesBloc, RandomRecipesState>(
        '''should emits [RandomRecipesLoading,RandomRecipesError]
         when  there is no internet connection''',
        // arange
        setUp: () {
          when(() => mockUsecase(NoParams())).thenAnswer(
            (invocation) async => Left(
              ConnectionFailure(),
            ),
          );
        },
        build: () => bloc,
        // act
        act: (bloc) => bloc.add(GetRecipesForRandomEvent()),
        // assert
        expect: () => <RandomRecipesState>[
          RandomRecipesLoading(),
          const RandomRecipesError(errorMessage: kNoConnectionError),
        ],
        verify: (_) => verify(() => mockUsecase(NoParams())).called(1),
      );
    },
  );
}
