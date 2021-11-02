import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String iconPath;
  const CategoryCard({
    Key? key,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
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
            const Text(
              'ketogenic',
              style: TextStyle(
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
