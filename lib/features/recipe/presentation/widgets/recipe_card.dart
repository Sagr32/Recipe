import 'package:flutter/material.dart';
import 'package:recipe/core/constants/constants.dart';
import 'package:recipe/core/util/size_config.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({Key? key}) : super(key: key);

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
                    tag: "",
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://spoonacular.com/recipeImages/634545-556x370.jpg',
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Barbecued Shrimp & Grits',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Barbecued Shrimp & Grits might be just the morn meal you are searching for.',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[400],
                    ),
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     buildCalories(recipe.calories.toString() + " Kcal"),
                //     Icon(
                //       Icons.favorite_border,
                //     )
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
