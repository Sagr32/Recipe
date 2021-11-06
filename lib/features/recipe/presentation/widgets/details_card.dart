import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// widget that display details about recipe
/// in  [bottom] of [SliverAppBar]
class DetailsCard extends StatelessWidget {
  /// constructor
  const DetailsCard({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  /// main string or title
  final String title;

  /// secondary string or subtitle
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: <Widget>[
          Text(
            title,
            style: GoogleFonts.mcLaren(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          Text(
            subTitle,
            style: GoogleFonts.mcLaren(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
