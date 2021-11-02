import 'package:flutter/material.dart';

import 'features/recipe/presentation/pages/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "RECIPE",
      home: HomeScreen(),
    );
  }
}



// class RecipeInfoWidget extends StatefulWidget {
//   const RecipeInfoWidget({Key? key}) : super(key: key);

//   @override
//   _RecipeInfoWidgetState createState() => _RecipeInfoWidgetState();
// }

// class _RecipeInfoWidgetState extends State<RecipeInfoWidget> {
//   @override
//   void initState() {
//     context.read<RecipeInfoBloc>().add(GetRecipeInfoEvent(recipeId: 715538));
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: ListView(
//             children: [
//               BlocBuilder<RecipeInfoBloc, RecipeInfoState>(
//                 builder: (context, state) {
//                   if (state is RecipeInfoInitial) {
//                     return Text(
//                       'Start searching!',
//                     );
//                   } else if (state is RecipeInfoLoading) {
//                     return Text('Loading');
//                   } else if (state is RecipeInfoLoaded) {
//                     return Text(parseHtml(state.recipe.summary));
//                   } else if (state is RecipeInfoError) {
//                     return Text(state.errorMessage);
//                   }
//                   return Container();
//                 },
//               ),
//               GestureDetector(
//                   onTap: () {
//                     context
//                         .read<RecipeInfoBloc>()
//                         .add(GetRecipeInfoEvent(recipeId: 715538));
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       "Big big big biiiiiig text ",
//                     ),
//                   )),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
