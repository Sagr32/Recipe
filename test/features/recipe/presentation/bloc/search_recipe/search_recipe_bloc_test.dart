import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:recipe/features/recipe/domain/usecases/search_recipes.dart';
import 'package:recipe/features/recipe/presentation/bloc/search_recipes/search_recipes_bloc.dart';

class MockSearchRecipesUsecase extends Mock implements SearchRecipes {}

void main() {
  late MockSearchRecipesUsecase usecase;
  late SearchRecipesBloc bloc;

  setUp(() {
    usecase = MockSearchRecipesUsecase();
    bloc = SearchRecipesBloc();
  });
}
