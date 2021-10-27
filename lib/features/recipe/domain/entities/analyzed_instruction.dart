import 'package:equatable/equatable.dart';
import 'package:recipe/features/recipe/domain/entities/recipe_step.dart';

/// Analyzed instructions step by step
class AnalyzedInstruction extends Equatable {
  /// Constructor
  const AnalyzedInstruction({
    this.name,
    this.recipeSteps,
  });

  /// instruction name
  final String? name;

  /// instruction steps
  final List<RecipeStep>? recipeSteps;

  @override
  List<Object?> get props => <Object?>[name, recipeSteps];
}
