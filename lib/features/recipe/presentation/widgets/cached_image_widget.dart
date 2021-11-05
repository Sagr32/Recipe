import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import 'cached_image_placeholder.dart';

/// Widget that use [Cached Image Network]
/// to show images in it
class CachedImageWidget extends StatelessWidget {
  /// Constructor
  const CachedImageWidget({
    Key? key,
    required this.imageUrl,
    required this.height,
    required this.width,
    required this.boxFit,
    required this.borderRadius,
  }) : super(key: key);

  /// border Radius
  final double borderRadius;

  /// image path or link
  final String imageUrl;

  /// widget height
  final double height;

  /// widget width
  final double width;

  /// image boxfit

  final BoxFit boxFit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (BuildContext context, ImageProvider imageProvider) =>
          ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Image(
          image: imageProvider,
          height: height,
          width: width,
          fit: boxFit,
        ),
      ),
      placeholder: (BuildContext context, String url) => CachedImagePlaceholder(
        // width: 10,
        height: height,
        width: width,
      ),
      errorWidget: (BuildContext context, String url, dynamic error) =>
          CachedImagePlaceholder(
        // width: 10,
        height: height,
        width: width,
      ),
    );
  }
}
