import 'package:flutter_test/flutter_test.dart';
import 'package:recipe/features/recipe/data/models/recipe_step_model.dart';
import 'package:recipe/features/recipe/domain/entities/recipe_step.dart';

import '../../../../test_constants.dart';

void main() {
  final jsonMap = {
    "step": "Cook pasta in a large pot of boiling water until al dente.",
  };
  test(
    'should be a subclass of RecipeStep Entity ',
    () async {
      // assert
      expect(tStepModel, isA<RecipeStep>());
    },
  );

  group('from json', () {
    test(
      'should return a valid RecipeStepModel from json',
      () async {
        // act
        final result = RecipeStepModel.fromJson(jsonMap);
        // assert
        expect(result, tStepModel);
      },
    );
  });
  group('to json', () {
    test(
      'should return valid json from StepModel',
      () async {
        // act
        final result = tStepModel.toJson();
        // assert
        expect(result, jsonMap);
      },
    );
  });
}
