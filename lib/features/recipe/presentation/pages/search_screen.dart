import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/util/size_config.dart';
import '../bloc/search_recipes/search_recipes_bloc.dart';
import '../widgets/error_display.dart';
import '../widgets/loading_widget.dart';
import '../widgets/recipe_card.dart';

/// Search Screen that hold search result
/// and display it in grid list
class SearchScreen extends StatefulWidget {
  /// constructor
  const SearchScreen({Key? key}) : super(key: key);

  /// route name
  static const String routeName = '/search-screen';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        title: TextFormField(
          autofocus: true,
          controller: _controller,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                _controller.clear();
              },
              icon: const Icon(
                Icons.close,
              ),
            ),
          ),
          onFieldSubmitted: (String input) {
            context
                .read<SearchRecipesBloc>()
                .add(GetRecipesForSearchEvent(query: input));
          },
        ),
      ),
      body: BlocBuilder<SearchRecipesBloc, SearchRecipesState>(
        builder: (BuildContext context, SearchRecipesState state) {
          if (state is SearchRecipesInitial) {
            return const Center(
              child: Text(
                'Start Searching !',
              ),
            );
          } else if (state is SearchRecipesLoading) {
            return const Center(
              child: LoadingWidget(height: 30, width: 100),
            );
          } else if (state is SearchRecipesLoaded) {
            return GridView.builder(
              itemCount: state.recipes.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: (SizeConfig.blockSizeHorizontal * 60) /
                    (SizeConfig.blockSizeVertical * 50),
              ),
              itemBuilder: (BuildContext context, int index) {
                return RecipeCard(
                  recipe: state.recipes[index],
                  width: 50,
                );
              },
            );
          } else if (state is SearchRecipesError) {
            return ErrorDisplay(errorMessage: state.errorMessage, height: 50);
          }
          return Container();
        },
      ),
    );
  }
}
