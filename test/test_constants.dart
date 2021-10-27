import 'package:recipe/features/recipe/data/models/analyzed_instruction_model.dart';
import 'package:recipe/features/recipe/data/models/extended_ingredient_model.dart';
import 'package:recipe/features/recipe/data/models/recipe_model.dart';
import 'package:recipe/features/recipe/data/models/recipe_step_model.dart';
import 'package:recipe/features/recipe/domain/entities/analyzed_instruction.dart';
import 'package:recipe/features/recipe/domain/entities/extended_ingredient.dart';
import 'package:recipe/features/recipe/domain/entities/recipe.dart';
import 'package:recipe/features/recipe/domain/entities/recipe_step.dart';

const Recipe tRecipe = Recipe(
    analyzedInstructions: [
      AnalyzedInstruction(
        name: "Cook pasta in a large pot of boiling water until al dente.",
        recipeSteps: [
          RecipeStep(
            recipeStep:
                "Cook pasta in a large pot of boiling water until al dente.",
          ),
        ],
      )
    ],
    cheap: false,
    cuisines: [
      'Italian',
    ],
    dairyFree: false,
    diets: [
      'vegan',
    ],
    dishTypes: [
      'lunch',
    ],
    extendedIngredients: [
      ExtendedIngredient(
        id: 1243,
        originalString: "1 1/4 cups Non-Fat Milk",
      )
    ],
    glutenFree: false,
    id: 214512,
    image: "https://spoonacular.com/recipeImages/654959-556x370.jpg",
    instructions: 'Cook pasta in a large pot of boiling water until al dente. ',
    readyInMinutes: 45,
    servings: 2,
    summary:
        'Pasta With Tuna might be just the main course you are searching for.',
    title: "Pasta With Tuna",
    vegan: false,
    vegetarian: false,
    veryHealthy: false,
    veryPopular: true);

const List<Recipe> tRecipesList = [
  Recipe(
      analyzedInstructions: [
        AnalyzedInstruction(
          name: "Cook pasta in a large pot of boiling water until al dente.",
          recipeSteps: [
            RecipeStep(
              recipeStep:
                  "Cook pasta in a large pot of boiling water until al dente.",
            ),
          ],
        )
      ],
      cheap: false,
      cuisines: [
        'Italian',
      ],
      dairyFree: false,
      diets: [
        'vegan',
      ],
      dishTypes: [
        'lunch',
      ],
      extendedIngredients: [
        ExtendedIngredient(
          id: 1243,
          originalString: "1 1/4 cups Non-Fat Milk",
        )
      ],
      glutenFree: false,
      id: 214512,
      image: "https://spoonacular.com/recipeImages/654959-556x370.jpg",
      instructions:
          'Cook pasta in a large pot of boiling water until al dente. ',
      readyInMinutes: 45,
      servings: 2,
      summary:
          'Pasta With Tuna might be just the main course you are searching for.',
      title: "Pasta With Tuna",
      vegan: false,
      vegetarian: false,
      veryHealthy: false,
      veryPopular: true),
  Recipe(
      analyzedInstructions: [
        AnalyzedInstruction(
          name: "Cook pasta in a large pot of boiling water until al dente.",
          recipeSteps: [],
        )
      ],
      cheap: false,
      cuisines: [
        'Italian',
      ],
      dairyFree: false,
      diets: [
        'vegan',
      ],
      dishTypes: [
        'lunch',
      ],
      extendedIngredients: [
        ExtendedIngredient(
          id: 1243,
          originalString: "1 1/4 cups Non-Fat Milk",
        )
      ],
      glutenFree: false,
      id: 214512,
      image: "https://spoonacular.com/recipeImages/654959-556x370.jpg",
      instructions:
          'Cook pasta in a large pot of boiling water until al dente. ',
      readyInMinutes: 45,
      servings: 2,
      summary:
          'Pasta With Tuna might be just the main course you are searching for.',
      title: "Pasta With Tuna",
      vegan: false,
      vegetarian: false,
      veryHealthy: false,
      veryPopular: true)
];

const tRecipeId = 125135;
const tQuery = 'Burger';
const tAnalyzedInstructionsList = [
  AnalyzedInstruction(
    name: "Cook pasta in a large pot of boiling water until al dente.",
    recipeSteps: [
      RecipeStep(
        recipeStep:
            "Cook pasta in a large pot of boiling water until al dente.",
      ),
    ],
  )
];

const List<RecipeModel> tRecipeModelList = [
  RecipeModel(
      analyzedInstructions: [
        AnalyzedInstructionModel(
          name: "Cook pasta in a large pot of boiling water until al dente.",
          recipeSteps: [
            RecipeStepModel(
              recipeStep:
                  "Cook pasta in a large pot of boiling water until al dente.",
            ),
          ],
        )
      ],
      cheap: false,
      cuisines: [
        'Italian',
      ],
      dairyFree: false,
      diets: [
        'vegan',
      ],
      dishTypes: [
        'lunch',
      ],
      extendedIngredients: [
        ExtendedIngredientModel(
          id: 1243,
          originalString: "1 1/4 cups Non-Fat Milk",
        )
      ],
      glutenFree: false,
      id: 214512,
      image: "https://spoonacular.com/recipeImages/654959-556x370.jpg",
      instructions:
          'Cook pasta in a large pot of boiling water until al dente. ',
      readyInMinutes: 45,
      servings: 2,
      summary:
          'Pasta With Tuna might be just the main course you are searching for.',
      title: "Pasta With Tuna",
      vegan: false,
      vegetarian: false,
      veryHealthy: false,
      veryPopular: true),
  RecipeModel(
      analyzedInstructions: [
        AnalyzedInstructionModel(
          name: "Cook pasta in a large pot of boiling water until al dente.",
          recipeSteps: [],
        )
      ],
      cheap: false,
      cuisines: [
        'Italian',
      ],
      dairyFree: false,
      diets: [
        'vegan',
      ],
      dishTypes: [
        'lunch',
      ],
      extendedIngredients: [
        ExtendedIngredientModel(
          id: 1243,
          originalString: "1 1/4 cups Non-Fat Milk",
        )
      ],
      glutenFree: false,
      id: 214512,
      image: "https://spoonacular.com/recipeImages/654959-556x370.jpg",
      instructions:
          'Cook pasta in a large pot of boiling water until al dente. ',
      readyInMinutes: 45,
      servings: 2,
      summary:
          'Pasta With Tuna might be just the main course you are searching for.',
      title: "Pasta With Tuna",
      vegan: false,
      vegetarian: false,
      veryHealthy: false,
      veryPopular: true)
];

const tAnalyzedInstructionModel = AnalyzedInstructionModel(
  name: "Cook pasta in a large pot of boiling water until al dente.",
  recipeSteps: [
    RecipeStepModel(
      recipeStep: "Cook pasta in a large pot of boiling water until al dente.",
    ),
    RecipeStepModel(
      recipeStep: "Cook pasta in a large pot of boiling water until al dente.",
    ),
  ],
);

const tExtendedIngredientModel = ExtendedIngredientModel(
  id: 9037,
  originalString: "1 avocado, thinly sliced",
);

const tStepModel = RecipeStepModel(
  recipeStep: "Cook pasta in a large pot of boiling water until al dente.",
);
