import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe/features/recipe/presentation/pages/details_screen.dart';
import 'package:recipe/features/recipe/presentation/pages/search_screen.dart';
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
          create: (BuildContext context) => di.sl<RecipeInfoBloc>(),
        ),
        BlocProvider(
          create: (BuildContext context) => di.sl<RandomRecipesBloc>(),
        ),
        BlocProvider(
          create: (BuildContext context) => di.sl<SimilarRecipesBloc>(),
        ),
        BlocProvider(
          create: (BuildContext context) => di.sl<SearchRecipesBloc>(),
        ),
        BlocProvider(
          create: (BuildContext context) => di.sl<RecipeVideoBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "RECIPE",
        home: const HomeScreen(),
        routes: {
          SearchScreen.routeName: (BuildContext context) =>
              const SearchScreen(),
          DetailsScreen.routeName: (BuildContext context) =>
              const DetailsScreen(),
        },
      ),
    );
  }
}
