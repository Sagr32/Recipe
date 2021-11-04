import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/util/size_config.dart';
import '../../domain/entities/recipe_video.dart';
import 'cached_image_widget.dart';

/// widget that holds recipe video information
/// and open link when clicking on play button
class VideoCard extends StatelessWidget {
  /// Constructor
  const VideoCard({required this.video, Key? key}) : super(key: key);

  /// Recipe video
  final RecipeVideo video;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {},
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Stack(
          children: <Widget>[
            CachedImageWidget(
              imageUrl: video.thumbnail ?? kAppLogo,
              height: SizeConfig.blockSizeVertical * 30,
              width: SizeConfig.safeBlockHorizontal * 90,
              boxFit: BoxFit.cover,
              borderRadius: 10,
            ),
            const Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              top: 0,
              child: Icon(
                Icons.play_circle,
                size: 48,
              ),
            ),
            Positioned(
              bottom: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: const <double>[0.0, 0.9],
                    colors: [
                      const Color(0xFF151C26).withOpacity(1.0),
                      const Color(0xFF151C30).withOpacity(0.1),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                width: SizeConfig.blockSizeHorizontal * 70,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        video.title ?? 'No title',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.mcLaren(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
