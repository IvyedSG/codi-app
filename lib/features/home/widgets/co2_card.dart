import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class CO2Card extends StatelessWidget {
  final bool showObjective;
  
  const CO2Card({
    super.key,
    this.showObjective = false,
  });

  @override
  Widget build(BuildContext context) {
    // Valores para la barra de progreso
    const double currentValue = 10; // Valor actual (10 Kg)
    const double targetValue = 150; // Objetivo (150 Kg)
    final progressValue = currentValue / targetValue; // Proporción para la barra

    return Card(
      elevation: 0,
      color: AppTheme.primaryGreen.withOpacity(0.1), // Color más claro
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Bordes más redondeados
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Título centrado
            const Text(
              'CO₂ acumulado',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            // Valor centrado
            const Text(
              '10 Kg',
              style: TextStyle(
                fontSize: 36, 
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),

            // Barra de progreso - ancho completo
            ClipRRect(
              borderRadius: BorderRadius.circular(4), 
              child: LinearProgressIndicator(
                value: progressValue,
                backgroundColor: AppTheme.primaryGreen.withOpacity(0.2),
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppTheme.primaryGreen.withOpacity(0.8),
                ),
                minHeight: 8,
              ),
            ),

            const SizedBox(height: 8),

            // Objetivo
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Objetivo: ',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '150 Kg',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
