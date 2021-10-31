import 'package:flutter_test/flutter_test.dart';
import 'package:recipe/core/constants/constants.dart';
import 'package:recipe/features/recipe/domain/entities/recipe.dart';
import 'package:recipe/features/recipe/presentation/bloc/similar_recipes.dart/similar_recipes_bloc.dart';

class FakeRecipe extends Fake implements Recipe {}

void main() {
  group(
    'Similar Recipes state',
    () {
      test(
        '[SimilarRecipesLoading] supports value comparison',
        () {
          expect(
            SimilarRecipesLoading(),
            SimilarRecipesLoading(),
          );
        },
      );
      test(
        '[SimilarRecipesLoaded] supports value comparison',
        () {
          final recipe = FakeRecipe();
          final list = [recipe];
          expect(
            SimilarRecipesLoaded(recipes: list),
            SimilarRecipesLoaded(recipes: list),
          );
        },
      );
      test(
        '[SimilarRecipesError ] supports value comparison',
        () {
          expect(
            SimilarRecipesError(errorMessage: kErrorMessage),
            SimilarRecipesError(errorMessage: kErrorMessage),
          );
        },
      );
    },
  );
}
