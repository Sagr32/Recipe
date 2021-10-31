import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:recipe/core/usecase/usecase.dart';
import 'package:recipe/features/recipe/domain/repositories/recipe_repository.dart';
import 'package:recipe/features/recipe/domain/usecases/search_recipes.dart';

import '../../../../test_constants.dart';

class MockRecipeReposity extends Mock implements RecipeRepository {}

void main() {
  late MockRecipeReposity mockRecipeReposity;
  late SearchRecipes usecase;

  setUp(() {
    mockRecipeReposity = MockRecipeReposity();
    usecase = SearchRecipes(mockRecipeReposity);
  });

  test(
    'should get a list of recipes with specific query',
    () async {
      // arrange
      when(() => mockRecipeReposity.searchRecipes(query: tQuery))
          .thenAnswer((invocation) async => const Right(tRecipesList));
      // act
      final result = await usecase(StringParams(query: tQuery));
      // assert
      verify(() => mockRecipeReposity.searchRecipes(query: tQuery));
      expect(result, const Right(tRecipesList));
      verifyNoMoreInteractions(mockRecipeReposity);
    },
  );
}
