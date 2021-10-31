import 'package:flutter_test/flutter_test.dart';
import 'package:recipe/features/recipe/presentation/bloc/recipe_info/recipe_info_bloc.dart';

import '../../../../../test_constants.dart';

void main() {
  group(
    'Recipe Info event',
    () {
      test(
        'supports value comparison',
        () {
          expect(
            GetRecipeInfoEvent(recipeId: tRecipeId),
            GetRecipeInfoEvent(recipeId: tRecipeId),
          );
        },
      );
    },
  );
}
