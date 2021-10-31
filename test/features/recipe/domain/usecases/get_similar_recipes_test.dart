import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:recipe/core/usecase/usecase.dart';
import 'package:recipe/features/recipe/domain/repositories/recipe_repository.dart';
import 'package:recipe/features/recipe/domain/usecases/get_similar_recipes.dart';

import '../../../../test_constants.dart';

class MockRecipeReposity extends Mock implements RecipeRepository {}

void main() {
  late MockRecipeReposity mockRecipeReposity;
  late GetSimilarRecipes usecase;

  setUp(() {
    mockRecipeReposity = MockRecipeReposity();
    usecase = GetSimilarRecipes(mockRecipeReposity);
  });

  test(
    'should get a list of similar recipes',
    () async {
      // arrange
      when(() => mockRecipeReposity.getSimilarRecipes(recipeId: tRecipeId))
          .thenAnswer((invocation) async => const Right(tRecipesList));
      // act
      final result = await usecase(IntParams(recipeId: tRecipeId));
      // assert
      verify(() => mockRecipeReposity.getSimilarRecipes(recipeId: tRecipeId));
      expect(result, const Right(tRecipesList));
      verifyNoMoreInteractions(mockRecipeReposity);
    },
  );
}
