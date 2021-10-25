import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:recipe/core/usecase/usecase.dart';
import 'package:recipe/features/recipe/domain/repositories/recipe_repository.dart';
import 'package:recipe/features/recipe/domain/usecases/get_random_recipes.dart';

import '../../../../test_constants.dart';

class MockRecipeReposity extends Mock implements RecipeRepository {}

void main() {
  late MockRecipeReposity mockRecipeReposity;
  late GetRandomRecipes usecase;
  setUp(() {
    mockRecipeReposity = MockRecipeReposity();
    usecase = GetRandomRecipes(mockRecipeReposity);
  });

  test(
    'should get a list of random recipes',
    () async {
      // arrange
      when(() => mockRecipeReposity.getRandomRecipes())
          .thenAnswer((invocation) async => const Right(tRecipesList));
      // act
      final result = await usecase(NoParams());
      // assert
      verify(() => mockRecipeReposity.getRandomRecipes());
      expect(result, const Right(tRecipesList));
      verifyNoMoreInteractions(mockRecipeReposity);
    },
  );
}
