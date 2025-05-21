import 'package:flutter/material.dart';
import '../../../shared/widgets/app_bottom_nav_bar.dart';
import '../../../shared/widgets/animated_page_transition.dart';
import '../../../core/theme/app_theme.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Simular datos para el historial
    final List<Map<String, dynamic>> historyItems = [
      {
        'date': '15 May 2025',
        'store': 'Tottus',
        'co2': 8.2,
        'isGreen': true,  // Antes era 'points'
        'items': 12,
        'hasPromo': true,
      },
      {
        'date': '10 May 2025',
        'store': 'Plaza Vea',
        'co2': 15.7,
        'isGreen': false,  // Antes era 'points'
        'items': 8,
        'hasPromo': false,
      },
      {
        'date': '02 May 2025',
        'store': 'Metro',
        'co2': 5.3,
        'isGreen': true,  // Antes era 'points'
        'items': 15,
        'hasPromo': true,
      },
      {
        'date': '28 Abr 2025',
        'store': 'Tottus',
        'co2': 12.8,
        'isGreen': false,  // Antes era 'points'
        'items': 10,
        'hasPromo': false,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFEEF6F6), // Color #EEF6F6 consistente
      appBar: AppBar(
        backgroundColor: const Color(0xFFEEF6F6),
        elevation: 0,
        title: const Text(
          'Historial',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.black),
            onPressed: () {
              // Mostrar opciones de filtrado
            },
          ),
        ],
      ),
      body: AnimatedPageTransition(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Descripción del historial
              const Text(
                'Revisa tus compras anteriores y su impacto ambiental',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Resumen de actividad
              _buildActivitySummaryCard(),
              
              const SizedBox(height: 24),
              
              // Título de sección
              const Text(
                'Compras recientes',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Lista de elementos del historial
              SingleChildScrollView(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: historyItems.length,
                  itemBuilder: (context, index) {
                    final item = historyItems[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: RepaintBoundary( // Mejora el rendimiento al aislar la pintura
                        child: _buildHistoryItem(
                          date: item['date'],
                          store: item['store'],
                          co2: item['co2'],
                          isGreen: item['isGreen'], // Cambiado de 'points'
                          items: item['items'],
                          hasPromo: item['hasPromo'],
                        ),
                      ),
                    );
                  },
                ),
              ),
              
              // Espacio adicional al final para evitar que el último elemento
              // quede pegado a la barra de navegación
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const AppBottomNavBar(currentIndex: 3),
    );
  }

  Widget _buildActivitySummaryCard() {
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
            const Text(
              'Resumen de actividad',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            
            const SizedBox(height: 20),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildActivityStat(
                  value: '4',
                  label: 'Compras',
                  icon: Icons.shopping_cart_outlined,
                ),
                _buildActivityStat(
                  value: '2',
                  label: 'Recibos Verdes',
                  icon: Icons.eco_outlined,
                ),
                _buildActivityStat(
                  value: '42 Kg',
                  label: 'CO2 Total',
                  icon: Icons.cloud_outlined,
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Gráfico simplificado (se podría mejorar con un gráfico real)
            Container(
              height: 80,
              decoration: BoxDecoration(
                color: const Color(0xFFEEF6F6),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _buildBarColumn(0.3, 'Ene'),
                  _buildBarColumn(0.5, 'Feb'),
                  _buildBarColumn(0.4, 'Mar'),
                  _buildBarColumn(0.7, 'Abr'),
                  _buildBarColumn(0.6, 'May', isActive: true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityStat({
    required String value,
    required String label,
    required IconData icon,
  }) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0xFF9AE1B7).withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: const Color(0xFF1C6734),
            size: 24,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.black.withOpacity(0.7),
          ),
        ),
      ],
    );
  }

  Widget _buildBarColumn(double height, String label, {bool isActive = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 24,
          height: 50 * height,
          decoration: BoxDecoration(
            color: isActive 
                ? const Color(0xFF9AE1B7) 
                : const Color(0xFF9AE1B7).withOpacity(0.4),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            color: Colors.black.withOpacity(0.7),
          ),
        ),
      ],
    );
  }

  Widget _buildHistoryItem({
    required String date,
    required String store,
    required double co2,
    required bool isGreen, // Cambiado de 'points'
    required int items,
    required bool hasPromo,
  }) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Encabezado con fecha y tienda
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF9AE1B7).withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.receipt_long_rounded,
                        color: Color(0xFF1C6734),
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          date,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          store,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                if (hasPromo)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF9AE1B7).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.local_offer_outlined,
                          size: 14,
                          color: Color(0xFF1C6734),
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Promos',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1C6734),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Línea divisoria
            Divider(color: Colors.grey.withOpacity(0.2)),
            
            const SizedBox(height: 16),
            
            // Stats de la compra
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildPurchaseStat(
                  label: 'CO2 generado',
                  value: '$co2 Kg',
                  icon: Icons.cloud_outlined,
                ),
                _buildPurchaseStat(
                  label: 'Estado',
                  value: isGreen ? 'Verde' : 'Regular',
                  icon: isGreen ? Icons.eco_outlined : Icons.receipt_outlined,
                  isHighlighted: isGreen,
                ),
                _buildPurchaseStat(
                  label: 'Productos',
                  value: '$items items',
                  icon: Icons.shopping_bag_outlined,
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Botón para ver detalles
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                side: const BorderSide(color: Color(0xFF1C6734), width: 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Ver detalles',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.arrow_forward,
                    size: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPurchaseStat({
    required String label,
    required String value,
    required IconData icon,
    bool isHighlighted = false,
  }) {
    final color = isHighlighted ? const Color(0xFF1C6734) : Colors.black;
    final valueStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: color,
    );
    
    return Column(
      children: [
        Icon(
          icon,
          size: 20,
          color: color,
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: valueStyle,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.black.withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}