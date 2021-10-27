import 'package:equatable/equatable.dart';

/// step entity that holds analyzed steps
class RecipeStep extends Equatable {
  const RecipeStep({this.recipeStep});

  /// every single step as String
  final String? recipeStep;

  @override
  List<Object?> get props => [recipeStep];
}
