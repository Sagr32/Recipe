import 'package:recipe/features/recipe/domain/entities/recipe_step.dart';

/// step entity that holds analyzed steps
class RecipeStepModel extends RecipeStep {
  const RecipeStepModel({this.recipeStep}) : super(recipeStep: recipeStep);

  /// every single step as String
  final String? recipeStep;

  /// Factory constructor From json
  factory RecipeStepModel.fromJson(Map<String, dynamic> json) =>
      RecipeStepModel(
        recipeStep: json['step'] as String?,
      );

  /// to json
  Map<String, dynamic> toJson() => {
        'step': recipeStep,
      };
}
