import 'package:recipe/features/recipe/domain/entities/recipe_video.dart';

/// Recipe Video model that extends Recipe Video Entity
class RecipeVideoModel extends RecipeVideo {
  /// Constructor
  const RecipeVideoModel({
    this.title,
    this.youTubeId,
    this.views,
    this.thumbnail,
    this.length,
  }) : super(
            length: length,
            title: title,
            youTubeId: youTubeId,
            thumbnail: thumbnail,
            views: views);

  /// Factory constructor from json
  factory RecipeVideoModel.fromJson(Map<String, dynamic> json) {
    return RecipeVideoModel(
      title: json['title'] as String?,
      youTubeId: json['youTubeId'] as String?,
      views: json['views'] as int?,
      thumbnail: json['thumbnail'] as String?,
      length: json['length'] as int?,
    );
  }

  /// to json
  Map<String, dynamic> toJson() => {
        'title': title,
        'youTubeId': youTubeId,
        'views': views,
        'thumbnail': thumbnail,
        'length': length,
      };

  /// video title
  final String? title;

  /// video youtube id
  final String? youTubeId;

  /// video total views
  final int? views;

  /// video thumnail
  final String? thumbnail;

  /// video total lenght in seconds
  final int? length;
}
