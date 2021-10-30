import 'package:flutter_test/flutter_test.dart';
import 'package:recipe/core/constants/constants.dart';
import 'package:recipe/features/recipe/domain/entities/recipe.dart';
import 'package:recipe/features/recipe/presentation/bloc/random_recipes/random_recipes_bloc.dart';

class FakeRecipe extends Fake implements Recipe {}

void main() {
  group(
    'Random Recipes state',
    () {
      test(
        '[Loading state] supports value comparison',
        () {
          expect(RandomRecipesLoading(), RandomRecipesLoading());
        },
      );
      test(
        '[Loaded state] supports value comparison',
        () {
          final recipe = FakeRecipe();
          final list = [recipe];
          expect(RandomRecipesLoaded(recipes: list),
              RandomRecipesLoaded(recipes: list));
        },
      );
      test(
        '[Error state] supports value comparison',
        () {
          expect(RandomRecipesError(errorMessage: kErrorMessage),
              RandomRecipesError(errorMessage: kErrorMessage));
        },
      );
    },
  );
}
