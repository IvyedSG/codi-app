import 'package:flutter/material.dart';

class PromoGridItem extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final String store;
  final String validity;

  const PromoGridItem({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.store,
    required this.validity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Parte superior con icono
          Container(
            height: 90,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFF9AE1B7).withOpacity(0.2),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Center(
              child: Icon(
                icon,
                size: 40,
                color: const Color(0xFF1C6734),
              ),
            ),
          ),
          // Contenido
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black.withOpacity(0.7),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.store,
                      size: 12,
                      color: Colors.black.withOpacity(0.6),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      store,
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: 12,
                      color: Colors.black.withOpacity(0.6),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      validity,
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}