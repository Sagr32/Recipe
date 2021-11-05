import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe/core/util/size_config.dart';

/// widget that display error message
class ErrorDisplay extends StatelessWidget {
  /// constructor
  const ErrorDisplay({
    Key? key,
    required this.errorMessage,
    required this.height,
  }) : super(key: key);

  /// message to display
  final String errorMessage;

  /// widget height
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.blockSizeVertical * height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/icons/404.png',
          ),
          Text(
            errorMessage,
            style: GoogleFonts.mcLaren(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
