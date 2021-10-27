import 'package:flutter_test/flutter_test.dart';
import 'package:recipe/features/recipe/data/models/extended_ingredient_model.dart';
import 'package:recipe/features/recipe/domain/entities/extended_ingredient.dart';

import '../../../../test_constants.dart';

void main() {
  final Map<String, dynamic> jsonMap = {
    "id": 9037,
    "originalString": "1 avocado, thinly sliced"
  };
  test('should be a subclass of ExtendedIngredient Entity', () {
    // assert
    expect(tExtendedIngredientModel, isA<ExtendedIngredient>());
  });
  group('from json', () {
    test(
      'should return a valid ExtendedIngredientModel from json ',
      () async {
        // act
        final result = ExtendedIngredientModel.fromJson(jsonMap);
        // assert
        expect(result, tExtendedIngredientModel);
      },
    );
  });
  group('to json', () {
    test(
      'should return valid json from ExtendedIngredientModel ',
      () async {
        // act
        final result = tExtendedIngredientModel.toJson();
        // assert
        expect(result, jsonMap);
      },
    );
  });
}
