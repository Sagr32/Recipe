import 'package:flutter_test/flutter_test.dart';
import 'package:recipe/features/recipe/presentation/bloc/similar_recipes.dart/similar_recipes_bloc.dart';

import '../../../../../test_constants.dart';

void main() {
  group(
    'Similar Recipes event',
    () {
      test(
        'supports value comparison',
        () {
          expect(
            GetSimilarRecipesEvent(recipeId: tRecipeId),
            GetSimilarRecipesEvent(recipeId: tRecipeId),
          );
        },
      );
    },
  );
}
