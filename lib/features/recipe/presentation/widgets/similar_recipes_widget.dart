import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/recipe_info/recipe_info_bloc.dart';
import '../../../../core/util/size_config.dart';
import '../bloc/similar_recipes.dart/similar_recipes_bloc.dart';
import 'error_display.dart';
import 'loading_widget.dart';
import 'recipe_card.dart';

/// widget that represent similar recipes
/// and shown as horizontal listview
class SimilarRecipesWidget extends StatefulWidget {
  /// constructor
  const SimilarRecipesWidget({Key? key, required this.recipeId})
      : super(key: key);
  final int? recipeId;

  @override
  _SimilarRecipesWidgetState createState() => _SimilarRecipesWidgetState();
}

class _SimilarRecipesWidgetState extends State<SimilarRecipesWidget> {
  @override
  void initState() {
    context
        .read<SimilarRecipesBloc>()
        .add(GetSimilarRecipesEvent(recipeId: widget.recipeId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarRecipesBloc, SimilarRecipesState>(
      builder: (BuildContext context, SimilarRecipesState state) {
        if (state is SimilarRecipesLoading) {
          return const LoadingWidget(height: 30, width: 100);
        } else if (state is SimilarRecipesLoaded) {
          return SizedBox(
            height: SizeConfig.blockSizeVertical * 30,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return RecipeCard(
                  recipe: state.recipes[index],
                  width: 40,
                  onTap: () {
                    context.read<RecipeInfoBloc>().add(
                          GetRecipeInfoEvent(
                            recipeId: state.recipes[index].id,
                          ),
                        );
                  },
                );
              },
            ),
          );
        } else if (state is SimilarRecipesError) {
          return ErrorDisplay(errorMessage: state.errorMessage, height: 30);
        }
        return Container();
      },
    );
  }
}
