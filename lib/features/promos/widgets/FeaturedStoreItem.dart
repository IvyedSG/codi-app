import 'package:flutter/material.dart';

class FeaturedStoreItem extends StatelessWidget {
  final String name;
  final String logoPath;
  final String promoCount;

  const FeaturedStoreItem({
    super.key,
    required this.name,
    required this.logoPath,
    required this.promoCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              logoPath,
              width: 70,
              height: 70,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            promoCount,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}