import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Widget that display card holds category diet name and image
/// like [vegan , vegetarian]
class CategoryDietsCard extends StatelessWidget {
  /// constructor
  const CategoryDietsCard({
    Key? key,
    required this.iconPath,
  }) : super(key: key);

  /// icon path in assets folder
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              'assets/icons/$iconPath.png',
              height: 24,
              width: 24,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              iconPath,
              style: GoogleFonts.mcLaren(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
