import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class CarboPointsCard extends StatelessWidget {
  const CarboPointsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppTheme.primaryGreen
          .withOpacity(0.1), // Color más claro como en la imagen
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Bordes más redondeados
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .center, // Centrar todos los elementos horizontalmente
          mainAxisAlignment: MainAxisAlignment.center, // Centrar verticalmente
          children: [
            const Text(
              'CarboPuntos',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center, // Centrar el texto
            ),
            const SizedBox(height: 12), // Espacio reducido
            const Text(
              '320',
              style: TextStyle(
                fontSize: 36, // Tamaño más grande
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center, // Centrar el texto
            ),
            const SizedBox(height: 12), // Espacio reducido
            SizedBox(
              width: double.infinity, // Ancho completo
              height: 44, // Altura mayor para mejor visibilidad
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        22), // Más redondeado como en la imagen
                  ),
                  padding: EdgeInsets.zero,
                ),
                child: const Text(
                  'Canjear',
                  style: TextStyle(
                    fontSize: 16, // Texto más grande
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
