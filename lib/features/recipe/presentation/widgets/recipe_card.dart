import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe/features/recipe/presentation/pages/details_screen.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/util/size_config.dart';
import '../../domain/entities/recipe.dart';

/// widget that display Recipe image , title and summary
/// in a beautiful card

class RecipeCard extends StatelessWidget {
  /// constructor
  const RecipeCard({required this.recipe, required this.width, Key? key})
      : super(key: key);

  /// [Recipe] holds recipe information
  final Recipe recipe;

  /// widget width
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          DetailsScreen.routeName,
          arguments: recipe.id,
        );
      },
      child: SizedBox(
        width: SizeConfig.blockSizeHorizontal * width,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Hero(
                    tag: recipe.id.toString(),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            recipe.image ?? kAppLogo,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  recipe.title ?? 'N/A',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: GoogleFonts.mcLaren(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                recipe.summary!.isEmpty
                    ? Container()
                    : Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          recipe.summary ?? 'N/A',
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.mcLaren(
                            fontSize: 16,
                            color: Colors.grey[400],
                          ),
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
