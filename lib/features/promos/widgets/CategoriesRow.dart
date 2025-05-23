import 'package:flutter/material.dart';

class CategoriesRow extends StatelessWidget {
  final List<CategoryItem> categories;

  const CategoriesRow({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: categories.map((category) {
        return Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: const Color(0xFF9AE1B7).withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                category.icon,
                color: const Color(0xFF1C6734),
                size: 30,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              category.label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}

class CategoryItem {
  final IconData icon;
  final String label;

  const CategoryItem({
    required this.icon,
    required this.label,
  });
}