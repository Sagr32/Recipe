import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../pages/details_screen.dart';
import 'error_display.dart';
import '../../../../core/util/size_config.dart';
import '../bloc/random_recipes/random_recipes_bloc.dart';
import 'loading_widget.dart';
import 'recipe_card.dart';

/// widget that holds list of [RecipeCard]
/// in horizontal view if loaded ,
/// and display error message when error occurs

class RandomRecipesWidget extends StatelessWidget {
  /// constructor
  const RandomRecipesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RandomRecipesBloc, RandomRecipesState>(
      builder: (BuildContext context, RandomRecipesState state) {
        if (state is RandomRecipesLoading) {
          return const LoadingWidget(
            height: 30,
            width: 100,
          );
        } else if (state is RandomRecipesLoaded) {
          return SizedBox(
            height: SizeConfig.blockSizeVertical * 30,
            child: ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: state.recipes.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext ctx, int index) {
                return RecipeCard(
                  recipe: state.recipes[index],
                  width: 60,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      DetailsScreen.routeName,
                      arguments: state.recipes[index].id,
                    );
                  },
                );
              },
            ),
          );
        } else if (state is RandomRecipesError) {
          return ErrorDisplay(errorMessage: state.errorMessage, height: 30);
        }
        return Container();
      },
    );
  }
}
