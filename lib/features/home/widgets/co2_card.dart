import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class CO2Card extends StatelessWidget {
  const CO2Card({super.key});

  @override
  Widget build(BuildContext context) {
    // Valores para la barra de progreso
    const double currentValue = 10; // Valor actual (10 Kg)
    const double targetValue = 150; // Objetivo (150 Kg)
    final progressValue =
        currentValue / targetValue; // Proporción para la barra

    return Card(
      elevation: 0,
      color: AppTheme.primaryGreen.withOpacity(0.1), // Color más claro
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Bordes más redondeados
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.center, // Centrar todo horizontalmente
          children: [
            // Título centrado
            const Center(
              child: Text(
                'CO₂ acumulado',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 8),
            // Valor centrado
            const Center(
              child: Text(
                '10 Kg',
                style: TextStyle(
                  fontSize: 36, // Más grande
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 12),

            // Barra de progreso - ancho completo
            ClipRRect(
              borderRadius: BorderRadius.circular(4), // Bordes redondeados
              child: LinearProgressIndicator(
                value: progressValue, // Valor de progreso (0.0 a 1.0)
                backgroundColor:
                    AppTheme.primaryGreen.withOpacity(0.2), // Fondo más claro
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppTheme.primaryGreen
                      .withOpacity(0.8), // Color más oscuro para la barra
                ),
                minHeight: 8, // Altura de la barra
              ),
            ),

            const SizedBox(height: 8),

            // Objetivo - alineado al inicio pero dentro del flujo centrado
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Centrar la fila
              children: const [
                Text(
                  'Objetivo: ',
                  style: TextStyle(
                    fontSize: 14, // Un poco más grande
                    color: Colors.black87,
                    fontWeight: FontWeight.w500, // Un poco más bold
                  ),
                ),
                Text(
                  '150 Kg',
                  style: TextStyle(
                    fontSize: 14, // Un poco más grande
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
