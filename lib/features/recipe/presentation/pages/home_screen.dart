import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/util/random_query.dart';
import 'search_screen.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/recipe_video_widget.dart';
import '../../../../core/constants/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/util/size_config.dart';
import '../bloc/random_recipes/random_recipes_bloc.dart';
import '../bloc/recipe_video/recipe_video_bloc.dart';
import '../widgets/cached_image_widget.dart';
import '../widgets/category_card.dart';
import '../widgets/loading_widget.dart';
import '../widgets/random_recipes_widget.dart';
import '../widgets/recipe_card.dart';
import '../widgets/video_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Home screen that holds list of [CategoryDietsCard]
/// list of [VideoCard] and list of [RecipeCard]
class HomeScreen extends StatefulWidget {
  /// Constructor
  const HomeScreen({Key? key}) : super(key: key);

  /// route name
  static const String routeName = '/home-screen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime? currentBackPressTime;

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: 'Tap back again to exit');
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  void initState() {
    super.initState();
    context
        .read<RecipeVideoBloc>()
        .add(GetRecipeVideoEvent(query: randomQuery));
    context.read<RandomRecipesBloc>().add(GetRecipesForRandomEvent());
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        key: _scaffoldKey,
        drawer: const CustomDrawer(),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'RECIPE',
            style: GoogleFonts.mcLaren(
              color: kMainColor,
            ),
          ),
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            context
                .read<RecipeVideoBloc>()
                .add(GetRecipeVideoEvent(query: randomQuery));
            context.read<RandomRecipesBloc>().add(GetRecipesForRandomEvent());
          },
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        SearchScreen.routeName,
                      );
                    },
                    child: Card(
                      elevation: 5,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        margin: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Search For Recipes',
                              style: GoogleFonts.mcLaren(),
                            ),
                            const Icon(
                              Icons.search_outlined,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Food videos for you',
                    style: GoogleFonts.mcLaren(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const RecipesVideosWidget(),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Random Recipes',
                    style: GoogleFonts.mcLaren(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const RandomRecipesWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
