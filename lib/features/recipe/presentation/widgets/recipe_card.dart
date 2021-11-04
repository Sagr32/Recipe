import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/util/size_config.dart';
import '../../domain/entities/recipe.dart';

/// widget that display Recipe image , title and summary
/// in a beautiful card

class RecipeCard extends StatelessWidget {
  /// constructor
  const RecipeCard({required this.recipe, Key? key}) : super(key: key);

  /// [Recipe] holds recipe information
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        width: SizeConfig.blockSizeHorizontal * 60,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    recipe.title ?? 'N/A',
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.mcLaren(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    recipe.summary ?? 'N/A',
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.mcLaren(
                      fontSize: 16,
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
