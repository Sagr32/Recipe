import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:recipe/core/constants/constants.dart';
import 'package:recipe/features/recipe/domain/entities/recipe.dart';
import 'package:recipe/features/recipe/presentation/bloc/recipe_info/recipe_info_bloc.dart';

class FakeRecipe extends Fake implements Recipe {}

void main() {
  group(
    'Recipe Info state',
    () {
      test(
        '[RecipeInfoLoading state] supports value comparison',
        () {
          expect(
            RecipeInfoLoading(),
            RecipeInfoLoading(),
          );
        },
      );
      test(
        '[RecipeInfoLoaded state] supports value comparison',
        () {
          final recipe = FakeRecipe();

          expect(
            RecipeInfoLoaded(recipe: recipe),
            RecipeInfoLoaded(recipe: recipe),
          );
        },
      );
      test(
        '[RecipeInfoError state] supports value comparison',
        () {
          expect(
            RecipeInfoError(errorMessage: kErrorMessage),
            RecipeInfoError(errorMessage: kErrorMessage),
          );
        },
      );
    },
  );
}
