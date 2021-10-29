import 'package:flutter_test/flutter_test.dart';
import 'package:recipe/features/recipe/data/models/recipe_model.dart';
import 'package:recipe/features/recipe/domain/entities/recipe.dart';

import '../../../../test_constants.dart';

void main() {
  final Map<String, dynamic> jsonMap = {
    'analyzedInstructions': [
      {
        'name': 'Cook pasta in a large pot of boiling water until al dente.',
        'steps': [
          {
            'step':
                'Cook pasta in a large pot of boiling water until al dente.',
          }
        ],
      }
    ],
    'cheap': false,
    'cuisines': [
      'Italian',
    ],
    'dairyFree': false,
    'diets': [
      'vegan',
    ],
    'dishTypes': [
      'lunch',
    ],
    'extendedIngredients': [
      {
        'id': 1243,
        'originalString': '1 1/4 cups Non-Fat Milk',
      }
    ],
    'glutenFree': false,
    'id': 214512,
    'image': 'https://spoonacular.com/recipeImages/654959-556x370.jpg',
    'instructions':
        'Cook pasta in a large pot of boiling water until al dente. ',
    'readyInMinutes': 45,
    'servings': 2,
    'summary':
        'Pasta With Tuna might be just the main course you are searching for.',
    'title': 'Pasta With Tuna',
    'vegan': false,
    'vegetarian': false,
    'veryHealthy': false,
    'veryPopular': true,
  };
  test('should be a subclass of Recipe Entity', () {
    // assert
    expect(tRecipeModelList[0], isA<Recipe>());
  });
  group('from json', () {
    test(
      'should return a valid RecipeModel from json ',
      () async {
        // act
        final result = RecipeModel.fromJson(jsonMap);
        // assert
        expect(result, tRecipeModelList[0]);
      },
    );
  });
  group('to json', () {
    test(
      'should return valid json from model',
      () async {
        // act
        final result = tRecipeModelList[0].toJson();
        // assert
        expect(result, jsonMap);
      },
    );
  });
}
