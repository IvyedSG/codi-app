import 'package:flutter/material.dart';

class DetailedStoreCard extends StatelessWidget {
  final String storeName;
  final String description;
  final String logoPath;
  final String promoCount;

  const DetailedStoreCard({
    super.key,
    required this.storeName,
    required this.description,
    required this.logoPath,
    required this.promoCount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Logo de la tienda
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    logoPath,
                    width: 60,
                    height: 60,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 16),
                // Nombre y contador
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        storeName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFF9AE1B7).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          promoCount,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF1C6734),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Descripción
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 16),
            // Botón de ver promociones
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF1C6734)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text(
                  'Ver todas las promociones',
                  style: TextStyle(
                    color: Color(0xFF1C6734),
                    fontWeight: FontWeight.w500,
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