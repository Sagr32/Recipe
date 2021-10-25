import 'package:equatable/equatable.dart';

/// Recipe entity that extends Equatable

class Recipe extends Equatable {
  /// Recipe Constructor
  const Recipe({
    this.vegetarian,
    this.vegan,
    this.glutenFree,
    this.dairyFree,
    this.veryHealthy,
    this.cheap,
    this.veryPopular,
    this.extendedIngredients,
    this.id,
    this.title,
    this.readyInMinutes,
    this.servings,
    this.image,
    this.summary,
    this.cuisines,
    this.dishTypes,
    this.diets,
    this.instructions,
    this.analyzedInstructions,
  });

  /// is recipe for vegetarian
  final bool? vegetarian;

  /// is recipe for vegan
  final bool? vegan;

  /// is recipe glutenFree
  final bool? glutenFree;

  /// is recipe dairyFree
  final bool? dairyFree;

  /// is recipe veryHealthy
  final bool? veryHealthy;

  /// is recipe cheap
  final bool? cheap;

  /// is recipe veryPopular
  final bool? veryPopular;

  /// Recipe Ingredients
  final List<String>? extendedIngredients;

  /// Recipe id
  final int? id;

  /// Recipe title
  final String? title;

  /// Recipe will be ready in
  final int? readyInMinutes;

  /// Recipe is servings for x person
  final int? servings;

  /// Recipe image
  final String? image;

  /// Recipe summary
  final String? summary;

  /// Recipe cuisines [italian ,European ] etc
  final List<String>? cuisines;

  /// Recipe dish type [lunch , dinner] etc
  final List<String>? dishTypes;

  /// Recipe matching diets [Gluten Free , Vegetarian]
  final List<String>? diets;

  /// Recipe instructions
  final String? instructions;

  /// Recipe detailed instruction with steps
  final List<String>? analyzedInstructions;

  @override
  List<Object?> get props {
    return [
      vegetarian,
      vegan,
      glutenFree,
      dairyFree,
      veryHealthy,
      cheap,
      veryPopular,
      extendedIngredients,
      id,
      title,
      readyInMinutes,
      servings,
      image,
      summary,
      cuisines,
      dishTypes,
      diets,
      instructions,
      analyzedInstructions,
    ];
  }
}
