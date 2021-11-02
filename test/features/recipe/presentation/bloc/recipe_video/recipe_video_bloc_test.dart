import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:recipe/core/constants/constants.dart';
import 'package:recipe/core/error/failure.dart';
import 'package:recipe/core/usecase/usecase.dart';
import 'package:recipe/features/recipe/domain/usecases/get_recipe_video.dart';
import 'package:recipe/features/recipe/presentation/bloc/recipe_video/recipe_video_bloc.dart';

import '../../../../../test_constants.dart';

class MockRecipeVideoUsecase extends Mock implements GetRecipeVideo {}

void main() {
  late MockRecipeVideoUsecase mockUsecase;
  late RecipeVideoBloc bloc;

  setUp(() {
    mockUsecase = MockRecipeVideoUsecase();
    bloc = RecipeVideoBloc(mockUsecase);
  });
  group(
    'Recipe Video Bloc',
    () {
      test(
        'should verify that initial state is [RecipeVideoInitial] ',
        () async {
          // assert
          expect(
            bloc.state,
            RecipeVideoInitial(),
          );
        },
      );

      test(
        'should call [RecipeVideo] use case',
        () async {
          // arrange
          when(() => mockUsecase(StringParams(query: tQuery)))
              .thenAnswer((invocation) async => Right(tRecipeVideoList));
          // act
          bloc.add(GetRecipeVideoEvent(query: tQuery));
          await untilCalled(() => mockUsecase(StringParams(query: tQuery)));
          // assert
          verify(() => mockUsecase(StringParams(query: tQuery)));
        },
      );

      blocTest<RecipeVideoBloc, RecipeVideoState>(
        '''should emits [RecipeVideoLoading,RecipeVideoLoaded]
         when calling usecase then call is successful''',
        // arange
        setUp: () {
          when(() => mockUsecase(StringParams(query: tQuery)))
              .thenAnswer((invocation) async => Right(tRecipeVideoList));
        },
        build: () => bloc,
        // act
        act: (bloc) => bloc.add(GetRecipeVideoEvent(query: tQuery)),
        // assert
        expect: () => <RecipeVideoState>[
          RecipeVideoLoading(),
          RecipeVideoLoaded(videos: tRecipeVideoList),
        ],
        verify: (_) =>
            verify(() => mockUsecase(StringParams(query: tQuery))).called(1),
      );
      blocTest<RecipeVideoBloc, RecipeVideoState>(
        '''should emits [RecipeVideoLoading,RecipeVideoError]
         when  error occurs''',
        // arange
        setUp: () {
          when(() => mockUsecase(StringParams(query: tQuery))).thenAnswer(
              (invocation) async =>
                  Left(ServerFailure(errorMessage: kErrorMessage)));
        },
        build: () => bloc,
        // act
        act: (bloc) => bloc.add(GetRecipeVideoEvent(query: tQuery)),
        // assert
        expect: () => <RecipeVideoState>[
          RecipeVideoLoading(),
          const RecipeVideoError(errorMessage: kErrorMessage),
        ],
        verify: (_) =>
            verify(() => mockUsecase(StringParams(query: tQuery))).called(1),
      );
      blocTest<RecipeVideoBloc, RecipeVideoState>(
        '''should emits [RecipeVideoLoading,RecipeVideoError]
         when  there is no internet connection''',
        // arange
        setUp: () {
          when(() => mockUsecase(StringParams(query: tQuery))).thenAnswer(
            (invocation) async => Left(
              ConnectionFailure(),
            ),
          );
        },
        build: () => bloc,
        // act
        act: (bloc) => bloc.add(GetRecipeVideoEvent(query: tQuery)),
        // assert
        expect: () => <RecipeVideoState>[
          RecipeVideoLoading(),
          const RecipeVideoError(errorMessage: kNoConnectionError),
        ],
        verify: (_) =>
            verify(() => mockUsecase(StringParams(query: tQuery))).called(1),
      );
    },
  );
}
