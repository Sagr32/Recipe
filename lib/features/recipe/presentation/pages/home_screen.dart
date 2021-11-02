import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:recipe/core/util/size_config.dart';
import 'package:recipe/features/recipe/presentation/widgets/category_card.dart';
import 'package:recipe/features/recipe/presentation/widgets/recipe_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Text(
                "Hello , Chef !",
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  CategoryCard(
                    iconPath: "ketogenic",
                  ),
                  CategoryCard(
                    iconPath: 'vegan',
                  ),
                  CategoryCard(
                    iconPath: 'vegetarian',
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                child: Card(
                  elevation: 5,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        Text('Search For Recipes'),
                        Icon(
                          Icons.search_outlined,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 30,
                child: ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return const RecipeCard();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
