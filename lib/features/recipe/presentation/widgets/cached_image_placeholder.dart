import 'package:flutter/material.dart';
import '../../../../core/constants/constants.dart';

/// Place holder widget for cached image widget
class CachedImagePlaceholder extends StatelessWidget {
  /// Constructor
  const CachedImagePlaceholder({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  /// widget height
  final double height;

  /// widget width
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kMainColor,
      ),
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          'assets/images/logo.png',
          height: height,
        ),
      ),
    );
  }
}
