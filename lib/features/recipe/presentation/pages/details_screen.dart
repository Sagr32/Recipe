import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html/parser.dart';
import 'home_screen.dart';
import '../widgets/expandable_widget.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/util/html_parser.dart';
import '../../../../core/util/size_config.dart';
import '../../domain/entities/recipe.dart';
import '../bloc/recipe_info/recipe_info_bloc.dart';
import '../widgets/cached_image_widget.dart';
import '../widgets/custom_sliver_appbar.dart';
import '../widgets/details_card.dart';
import '../widgets/error_display.dart';
import '../widgets/loading_widget.dart';
import '../widgets/similar_recipes_widget.dart';

/// Screen that contains details about recipe
/// and similar recipes to it
class DetailsScreen extends StatefulWidget {
  /// constructor
  const DetailsScreen({Key? key}) : super(key: key);

  /// route name
  static const String routeName = '/details-screen';

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late final int argumet;

  @override
  void didChangeDependencies() {
    argumet = ModalRoute.of(context)!.settings.arguments as int;
    context.read<RecipeInfoBloc>().add(GetRecipeInfoEvent(recipeId: argumet));

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RecipeInfoBloc, RecipeInfoState>(
        builder: (BuildContext context, RecipeInfoState state) {
          if (state is RecipeInfoLoading) {
            return const Center(
              child: LoadingWidget(
                height: 30,
                width: 100,
              ),
            );
          } else if (state is RecipeInfoLoaded) {
            return CustomScrollView(
              slivers: <Widget>[
                CustomSliverAppBar(
                  recipe: state.recipe,
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4.0,
                        ),
                        child: Text(
                          'Summary',
                          style: GoogleFonts.mcLaren(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                        ),
                        child: Text(
                          parseHtml(state.recipe.summary),
                          style: GoogleFonts.mcLaren(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      ExpandableWidget(
                        header: 'Ingredients',
                        expanded: ListView.builder(
                          primary: false,
                          itemCount: state.recipe.extendedIngredients!.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  state.recipe.extendedIngredients![index]
                                          .originalString ??
                                      'N/A',
                                  style: GoogleFonts.mcLaren(
                                    fontSize: 18,
                                    color: Colors.grey,
                                  ),
                                ),
                                const Divider(),
                              ],
                            );
                          },
                        ),
                        collapsed: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              state.recipe.extendedIngredients![0]
                                      .originalString ??
                                  '',
                              style: GoogleFonts.mcLaren(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                            const Text(
                              '......',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      ExpandableWidget(
                        header: 'Steps',
                        expanded: ListView.builder(
                          primary: false,
                          itemCount: state.recipe.analyzedInstructions!.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            final steps = state.recipe
                                .analyzedInstructions![index].recipeSteps;
                            return Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Step ${index + 1}'),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4.0),
                                  child: Text(
                                    '- ${state.recipe.analyzedInstructions![0].recipeSteps}',
                                    style: GoogleFonts.mcLaren(
                                      fontSize: 18,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                const Divider(),
                              ],
                            );
                          },
                        ),
                        collapsed: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              state.recipe.analyzedInstructions![0]
                                      .recipeSteps![0].recipeStep ??
                                  'No Steps available',
                              style: GoogleFonts.mcLaren(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                              maxLines: 3,
                            ),
                            const Text(
                              '......',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      SimilarRecipesWidget(recipeId: state.recipe.id),
                    ],
                  ),
                ),
              ],
            );
          } else if (state is RecipeInfoError) {
            return ErrorDisplay(errorMessage: state.errorMessage, height: 30);
          }
          return Container();
        },
      ),
    );
  }
}
