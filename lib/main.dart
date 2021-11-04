import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'features/recipe/presentation/bloc/recipe_info/recipe_info_bloc.dart';
import 'features/recipe/presentation/bloc/random_recipes/random_recipes_bloc.dart';
import 'features/recipe/presentation/bloc/recipe_video/recipe_video_bloc.dart';
import 'features/recipe/presentation/bloc/search_recipes/search_recipes_bloc.dart';
import 'features/recipe/presentation/bloc/similar_recipes.dart/similar_recipes_bloc.dart';
import 'injection_container.dart' as di;
import 'features/recipe/presentation/pages/home_screen.dart';

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<RecipeInfoBloc>(),
        ),
        BlocProvider(
          create: (context) => di.sl<RandomRecipesBloc>(),
        ),
        BlocProvider(
          create: (context) => di.sl<SimilarRecipesBloc>(),
        ),
        BlocProvider(
          create: (context) => di.sl<SearchRecipesBloc>(),
        ),
        BlocProvider(
          create: (context) => di.sl<RecipeVideoBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "RECIPE",
        home: HomeScreen(),
      ),
    );
  }
}
