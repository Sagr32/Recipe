/// main api endpoint or base url
const String kBaseUrl = 'api.spoonacular.com';

/// Recipe Information endpoint without including Nutrition
String kRecipeInfoEndpoint(int? recipeId) => 'recipes/$recipeId/information';

/// Similar Recipes endpoint to a specific one
String kSimilarRecipesEndpoint(int? recipeId) => 'recipes/$recipeId/similar';

/// Search for Recipes endpoint
const String kSearchRecipesEndpojnt = 'recipes/complexSearch';

/// Random Recipes endpoint
const String kRandomRecipesEndpoint = 'recipes/random';
