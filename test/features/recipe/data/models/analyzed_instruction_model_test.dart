import 'package:flutter_test/flutter_test.dart';
import 'package:recipe/features/recipe/data/models/analyzed_instruction_model.dart';
import 'package:recipe/features/recipe/domain/entities/analyzed_instruction.dart';

import '../../../../test_constants.dart';

void main() {
  final Map<String, dynamic> jsonMap = {
    "name": "Cook pasta in a large pot of boiling water until al dente.",
    "steps": [
      {
        "step": "Cook pasta in a large pot of boiling water until al dente.",
      },
      {
        "step": "Cook pasta in a large pot of boiling water until al dente.",
      },
    ]
  };
  test('should be a subclass of AnalyzedInstruction Entity', () {
    // assert
    expect(tAnalyzedInstructionModel, isA<AnalyzedInstruction>());
  });
  group('from json', () {
    test(
      'should return a valid AnalyzedInstructionModel from json ',
      () async {
        // act
        final result = AnalyzedInstructionModel.fromJson(jsonMap);
        // assert
        expect(result, tAnalyzedInstructionModel);
      },
    );
  });
  group('to json', () {
    test(
      'should return valid json from AnalyzedInstructionModel',
      () async {
        // act
        final result = tAnalyzedInstructionModel.toJson();
        // assert
        expect(result, jsonMap);
      },
    );
  });
}
