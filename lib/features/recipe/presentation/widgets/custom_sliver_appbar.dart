import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/util/size_config.dart';
import '../../domain/entities/recipe.dart';
import 'cached_image_widget.dart';
import 'details_card.dart';

/// Custom SliverAppBar that exsits in details screen
/// and contains recipe image and [DetailsCard]
class CustomSliverAppBar extends StatelessWidget {
  /// constructor
  const CustomSliverAppBar({required this.recipe, Key? key}) : super(key: key);

  /// Recipe
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: kMainColor,
      pinned: true,
      forceElevated: false,
      expandedHeight: SizeConfig.blockSizeVertical * 40,
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
          tag: "${recipe.id}",
          child: CachedImageWidget(
            borderRadius: 0,
            imageUrl: recipe.image ?? kAppLogo,
            boxFit: BoxFit.cover,
            height: 40,
            width: 100,
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(SizeConfig.blockSizeVertical * 7),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const <double>[0.0, 0.9],
              colors: <Color>[
                const Color(0xFF151C26).withOpacity(1.0),
                const Color(0xFF151C30).withOpacity(0.1),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  recipe.title ?? '',
                  style: GoogleFonts.mcLaren(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: <Widget>[
                    DetailsCard(
                      title: recipe.extendedIngredients!.length.toString(),
                      subTitle: ' Ingredients',
                    ),
                    DetailsCard(
                      title: recipe.servings.toString(),
                      subTitle: ' Serving',
                    ),
                    DetailsCard(
                      title: recipe.readyInMinutes.toString(),
                      subTitle: ' Minutes',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
