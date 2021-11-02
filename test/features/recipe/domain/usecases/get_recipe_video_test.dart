import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:recipe/core/usecase/usecase.dart';
import 'package:recipe/features/recipe/domain/repositories/recipe_repository.dart';
import 'package:recipe/features/recipe/domain/usecases/get_recipe_video.dart';

import '../../../../test_constants.dart';

class MockRecipeReposity extends Mock implements RecipeRepository {}

void main() {
  late MockRecipeReposity mockRecipeReposity;
  late GetRecipeVideo usecase;

  setUp(() {
    mockRecipeReposity = MockRecipeReposity();
    usecase = GetRecipeVideo(mockRecipeReposity);
  });

  test(
    'should get recipe videos',
    () async {
      // arrange
      when(() => mockRecipeReposity.getRecipesVideo(query: tQuery))
          .thenAnswer((invocation) async => const Right(tRecipeVideoList));
      // act
      final result = await usecase(StringParams(query: tQuery));
      // assert
      verify(() => mockRecipeReposity.getRecipesVideo(query: tQuery));
      expect(result, const Right(tRecipeVideoList));
      verifyNoMoreInteractions(mockRecipeReposity);
    },
  );
}
