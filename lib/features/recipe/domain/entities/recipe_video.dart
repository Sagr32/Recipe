import 'package:equatable/equatable.dart';

/// class that holds Recipe video information
class RecipeVideo extends Equatable {
  /// Constructor
  const RecipeVideo(this.title, this.youTubeId, this.views, this.thumbnail);

  /// video title
  final String? title;

  /// video youtube id
  final String? youTubeId;

  /// video total views
  final int? views;

  /// video thumbnail or small photo
  final String? thumbnail;
  @override
  List<Object?> get props => <Object?>[title, youTubeId, views, thumbnail];
}
