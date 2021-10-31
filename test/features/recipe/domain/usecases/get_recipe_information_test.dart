import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:recipe/core/usecase/usecase.dart';
import 'package:recipe/features/recipe/domain/repositories/recipe_repository.dart';
import 'package:recipe/features/recipe/domain/usecases/get_recipe_information.dart';

import '../../../../test_constants.dart';

class MockRecipeReposity extends Mock implements RecipeRepository {}

void main() {
  late MockRecipeReposity mockRecipeReposity;
  late GetRecipeInformation usecase;

  setUp(() {
    mockRecipeReposity = MockRecipeReposity();
    usecase = GetRecipeInformation(mockRecipeReposity);
  });

  test(
    'should get recipe full informations',
    () async {
      // arrange
      when(() => mockRecipeReposity.getRecipeInformation(recipeId: tRecipeId))
          .thenAnswer((invocation) async => const Right(tRecipe));
      // act
      final result = await usecase(IntParams(recipeId: tRecipeId));
      // assert
      verify(
          () => mockRecipeReposity.getRecipeInformation(recipeId: tRecipeId));
      expect(result, const Right(tRecipe));
      verifyNoMoreInteractions(mockRecipeReposity);
    },
  );
}
