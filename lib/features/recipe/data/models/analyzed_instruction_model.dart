import '../../domain/entities/analyzed_instruction.dart';
import 'recipe_step_model.dart';

/// [AnalyzedInstructionsModel] that extends [AnalyzedInstructions] Entity

class AnalyzedInstructionModel extends AnalyzedInstruction {
  /// Default constructor
  const AnalyzedInstructionModel({
    this.name,
    this.recipeSteps,
  }) : super(
          name: name,
          recipeSteps: recipeSteps,
        );

  /// Factory constructor From json
  factory AnalyzedInstructionModel.fromJson(Map<String, dynamic> json) {
    return AnalyzedInstructionModel(
      name: json['name'] as String?,
      recipeSteps: (json['steps'] as List<dynamic>?)
          ?.map((e) => RecipeStepModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  /// to json
  Map<String, dynamic> toJson() => {
        'name': name,
        'steps': recipeSteps?.map((e) => e.toJson()).toList(),
      };

  /// Instruction name
  final String? name;

  /// Instruction steps [step by step]
  final List<RecipeStepModel>? recipeSteps;
}
