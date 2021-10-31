import 'package:flutter_test/flutter_test.dart';
import 'package:recipe/features/recipe/presentation/bloc/random_recipes/random_recipes_bloc.dart';

void main() {
  group(
    'Random Recipes event',
    () {
      test(
        'supports value comparison',
        () {
          expect(
            GetRecipesForRandomEvent(),
            GetRecipesForRandomEvent(),
          );
        },
      );
    },
  );
}
