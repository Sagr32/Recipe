import '../../domain/entities/recipe.dart';
import 'analyzed_instruction_model.dart';
import 'extended_ingredient_model.dart';

/// Recipe Model that extends Recipe Entity
class RecipeModel extends Recipe {
  /// Default Constructor
  const RecipeModel({
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
  }) : super(
          vegetarian: vegetarian,
          analyzedInstructions: analyzedInstructions,
          cheap: cheap,
          cuisines: cuisines,
          dairyFree: dairyFree,
          diets: diets,
          dishTypes: dishTypes,
          extendedIngredients: extendedIngredients,
          glutenFree: glutenFree,
          id: id,
          image: image,
          instructions: instructions,
          readyInMinutes: readyInMinutes,
          servings: servings,
          summary: summary,
          title: title,
          vegan: vegan,
          veryHealthy: veryHealthy,
          veryPopular: veryPopular,
        );

  /// Factory constructor From json
  factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
        image: json['image'] ?? '',
        vegetarian: json['vegetarian'] ?? false,
        vegan: json['vegan'] ?? false,
        glutenFree: json['glutenFree'] ?? false,
        dairyFree: json['dairyFree'] ?? false,
        veryHealthy: json['veryHealthy'] ?? false,
        cheap: json['cheap'] ?? false,
        veryPopular: json['veryPopular'] ?? false,
        id: json['id'],
        title: json['title'],
        readyInMinutes: json['readyInMinutes'] ?? 00,
        servings: json['servings'] ?? 0,
        summary: json['summary'] ?? '',
        cuisines:
            json['cuisines'] != null ? json['cuisines'].cast<String>() : [],
        diets: json['diets'] != null ? json['diets'].cast<String>() : [],
        dishTypes:
            json['dishTypes'] != null ? json['dishTypes'].cast<String>() : [],
        instructions: json['instructions'] ?? '',
        extendedIngredients: (json['extendedIngredients'] as List<dynamic>?)
                ?.map((e) =>
                    ExtendedIngredientModel.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
        analyzedInstructions: (json['analyzedInstructions'] as List<dynamic>?)
                ?.map((e) => AnalyzedInstructionModel.fromJson(
                    e as Map<String, dynamic>))
                .toList() ??
            [],
      );

  /// to json
  Map<String, dynamic> toJson() => {
        'vegetarian': vegetarian,
        'vegan': vegan,
        'glutenFree': glutenFree,
        'dairyFree': dairyFree,
        'veryHealthy': veryHealthy,
        'cheap': cheap,
        'veryPopular': veryPopular,
        'extendedIngredients':
            extendedIngredients?.map((e) => e.toJson()).toList(),
        'id': id,
        'title': title,
        'readyInMinutes': readyInMinutes,
        'servings': servings,
        'image': image,
        'summary': summary,
        'cuisines': cuisines,
        'dishTypes': dishTypes,
        'diets': diets,
        'instructions': instructions,
        'analyzedInstructions':
            analyzedInstructions?.map((e) => e.toJson()).toList(),
      };

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
  final List<ExtendedIngredientModel>? extendedIngredients;

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
  final List<AnalyzedInstructionModel>? analyzedInstructions;
}
