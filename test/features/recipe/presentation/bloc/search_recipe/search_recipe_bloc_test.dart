import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:recipe/core/constants/constants.dart';
import 'package:recipe/core/error/failure.dart';
import 'package:recipe/core/usecase/usecase.dart';
import 'package:recipe/features/recipe/domain/usecases/search_recipes.dart';
import 'package:recipe/features/recipe/presentation/bloc/search_recipes/search_recipes_bloc.dart';

import '../../../../../test_constants.dart';

class MockSearchRecipesUsecase extends Mock implements SearchRecipes {}

void main() {
  late MockSearchRecipesUsecase mockUsecase;
  late SearchRecipesBloc bloc;

  setUp(() {
    mockUsecase = MockSearchRecipesUsecase();
    bloc = SearchRecipesBloc(mockUsecase);
  });
  group(
    'Search Recipes Bloc',
    () {
      test(
        'should verify that initial state is [SearchRecipesInitial] ',
        () async {
          // assert
          expect(
            bloc.state,
            SearchRecipesInitial(),
          );
        },
      );

      test(
        'should call [SearchRecipes] use case',
        () async {
          // arrange
          when(() => mockUsecase(Params(query: tQuery)))
              .thenAnswer((invocation) async => Right(tRecipesList));
          // act
          bloc.add(GetRecipesForSearchEvent(query: tQuery));
          await untilCalled(() => mockUsecase(Params(query: tQuery)));
          // assert
          verify(() => mockUsecase(Params(query: tQuery)));
        },
      );

      blocTest<SearchRecipesBloc, SearchRecipesState>(
        '''should emits [SearchRecipesLoading,SearchRecipesLoaded]
         when calling usecase then call is successful''',
        // arange
        setUp: () {
          when(() => mockUsecase(Params(query: tQuery)))
              .thenAnswer((invocation) async => Right(tRecipesList));
        },
        build: () => bloc,
        // act
        act: (bloc) => bloc.add(GetRecipesForSearchEvent(query: tQuery)),
        // assert
        expect: () => <SearchRecipesState>[
          SearchRecipesLoading(),
          SearchRecipesLoaded(recipes: tRecipesList),
        ],
        verify: (_) =>
            verify(() => mockUsecase(Params(query: tQuery))).called(1),
      );
      blocTest<SearchRecipesBloc, SearchRecipesState>(
        '''should emits [SearchRecipesLoading,SearchRecipesError]
         when  error occurs''',
        // arange
        setUp: () {
          when(() => mockUsecase(Params(query: tQuery))).thenAnswer(
              (invocation) async =>
                  Left(ServerFailure(errorMessage: kErrorMessage)));
        },
        build: () => bloc,
        // act
        act: (bloc) => bloc.add(GetRecipesForSearchEvent(query: tQuery)),
        // assert
        expect: () => <SearchRecipesState>[
          SearchRecipesLoading(),
          const SearchRecipesError(errorMessage: kErrorMessage),
        ],
        verify: (_) =>
            verify(() => mockUsecase(Params(query: tQuery))).called(1),
      );
      blocTest<SearchRecipesBloc, SearchRecipesState>(
        '''should emits [SearchRecipesLoading,SearchRecipesError]
         when  there is no internet connection''',
        // arange
        setUp: () {
          when(() => mockUsecase(Params(query: tQuery))).thenAnswer(
            (invocation) async => Left(
              ConnectionFailure(),
            ),
          );
        },
        build: () => bloc,
        // act
        act: (bloc) => bloc.add(GetRecipesForSearchEvent(query: tQuery)),
        // assert
        expect: () => <SearchRecipesState>[
          SearchRecipesLoading(),
          const SearchRecipesError(errorMessage: kNoConnectionError),
        ],
        verify: (_) =>
            verify(() => mockUsecase(Params(query: tQuery))).called(1),
      );
    },
  );
}
