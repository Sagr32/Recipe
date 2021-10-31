import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:recipe/core/constants/constants.dart';
import 'package:recipe/features/recipe/domain/entities/recipe.dart';
import 'package:recipe/features/recipe/presentation/bloc/search_recipes/search_recipes_bloc.dart';

class FakeRecipe extends Fake implements Recipe {}

void main() {
  group(
    'Search Recipes state',
    () {
      test(
        '[SearchRecipesLoading ] supports value comparison',
        () {
          expect(
            SearchRecipesLoading(),
            SearchRecipesLoading(),
          );
        },
      );
      test(
        '[SearchRecipesLoaded ] supports value comparison',
        () {
          final recipe = FakeRecipe();
          final list = [recipe];
          expect(
            SearchRecipesLoaded(recipes: list),
            SearchRecipesLoaded(recipes: list),
          );
        },
      );
      test(
        '[SearchRecipesError ] supports value comparison',
        () {
          expect(
            SearchRecipesError(errorMessage: kErrorMessage),
            SearchRecipesError(errorMessage: kErrorMessage),
          );
        },
      );
    },
  );
}
