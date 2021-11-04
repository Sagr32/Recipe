import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/core/util/size_config.dart';
import 'package:recipe/features/recipe/presentation/bloc/recipe_video/recipe_video_bloc.dart';
import 'package:recipe/features/recipe/presentation/widgets/loading_widget.dart';
import 'package:recipe/features/recipe/presentation/widgets/video_card.dart';

/// Widget that holds list of [VideoCard] if loaded
/// if it has error then it display error message
class RecipesVideosWidget extends StatelessWidget {
  /// Constructor
  const RecipesVideosWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeVideoBloc, RecipeVideoState>(
      builder: (BuildContext context, RecipeVideoState state) {
        if (state is RecipeVideoLoading) {
          return const LoadingWidget(height: 30, width: 100);
        }
        if (state is RecipeVideoLoaded) {
          return SizedBox(
            height: SizeConfig.blockSizeVertical * 30,
            child: ListView.builder(
              itemCount: state.videos.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext ctx, int index) {
                return VideoCard(
                  video: state.videos[index],
                );
              },
            ),
          );
        }
        return Container();
      },
    );
  }
}
