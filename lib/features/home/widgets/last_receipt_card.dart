import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LastReceiptCard extends StatelessWidget {
  final String title;
  
  const LastReceiptCard({
    super.key, 
    this.title = 'Última Factura',
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: const Color(0xFF9AE1B7), // Color #9AE1B7
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Título y subtítulo
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'Supermercado Tottus',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.calendar_today_outlined, size: 14, color: Colors.black54),
                            SizedBox(width: 4),
                            Text(
                              '15 May 2025',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.attach_money_outlined, size: 14, color: Colors.black54),
                            SizedBox(width: 2),
                            Text(
                              'S/ 75.50',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Logo de Tottus
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(6),
                  child: Image.asset(
                    'assets/images/tottus_logo.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Info de CO2 con etiqueta
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '10,5 Kg',
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'CO₂ generado',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
                
                // Ver detalles button - Sin icono y con border radius reducido
                SizedBox(
                  width: 130,
                  height: 42,
                  child: ElevatedButton(
                    onPressed: () {
                      context.go('/history');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14), // Border radius reducido
                      ),
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                    ),
                    child: const Text(
                      'Ver detalles',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
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
