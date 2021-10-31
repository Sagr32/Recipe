import 'package:flutter_test/flutter_test.dart';
import 'package:recipe/features/recipe/presentation/bloc/search_recipes/search_recipes_bloc.dart';

import '../../../../../test_constants.dart';

void main() {
  group(
    'Search Recipes event',
    () {
      test(
        'supports value comparison',
        () {
          expect(
            GetRecipesForSearchEvent(query: tQuery),
            GetRecipesForSearchEvent(query: tQuery),
          );
        },
      );
    },
  );
}
