import 'package:flutter_test/flutter_test.dart';
import 'package:recipe/features/recipe/data/models/recipe_video_model.dart';
import 'package:recipe/features/recipe/domain/entities/recipe_video.dart';

import '../../../../test_constants.dart';

void main() {
  final jsonMap = {
    "title":
        "Easy egg sandwich - quick and easy breakfast ideas - homemade breakfast egg recipes-healthy sandwich",
    "youTubeId": "RKMYYTz2jzg",
    "views": 1230,
    "thumbnail": "https://i.ytimg.com/vi/RKMYYTz2jzg/mqdefault.jpg",
    "length": 353
  };

  test(
    'should be a subclass of RecipeVideo Entity ',
    () async {
      // assert
      expect(tRecipeVideoModelList[0], isA<RecipeVideo>());
    },
  );

  group('from json', () {
    test(
      'should return a valid RecipeVideoModel from json',
      () async {
        // act
        final result = RecipeVideoModel.fromJson(jsonMap);
        // assert
        expect(result, tRecipeVideoModelList[0]);
      },
    );
  });
  group('to json', () {
    test(
      'should return valid json from RecipeVideoModel',
      () async {
        // act
        final result = tRecipeVideoModelList[0].toJson();
        // assert
        expect(result, jsonMap);
      },
    );
  });
}
