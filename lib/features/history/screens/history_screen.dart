import 'package:flutter/material.dart';
import '../../../shared/widgets/app_bottom_nav_bar.dart';
import '../../../shared/widgets/animated_page_transition.dart';
import '../../../core/theme/app_theme.dart';
import '../widgets/receipt_detail_view.dart';
import '../../upload/models/receipt_model.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  // Colores mejorados para mejor visibilidad
  static const Color verdeColor = Color(0xFF2E7D32); // Verde más oscuro y vibrante
  static const Color regularColor = Color(0xFFF57C00); // Naranja más oscuro
  static const Color altoColor = Color(0xFFD32F2F); // Rojo más oscuro

  // Simular datos para el historial usando el modelo Receipt
  final List<Receipt> historyItems = [
    Receipt(
      id: '1',
      storeName: 'Tottus',
      date: '15 May 2025',
      total: 75.50,
      co2: 6.3,
      impactLevel: 'verde',
      ecoProductCount: 5,
      receiptImagePath: 'assets/images/receipt_sample.jpg',
      scannedText: '',
    ),
    Receipt(
      id: '2',
      storeName: 'Plaza Vea',
      date: '10 May 2025',
      total: 120.80,
      co2: 14.2,
      impactLevel: 'regular',
      ecoProductCount: 2,
      receiptImagePath: 'assets/images/receipt_sample.jpg',
      scannedText: '',
    ),
    Receipt(
      id: '3',
      storeName: 'Metro',
      date: '02 May 2025',
      total: 95.30,
      co2: 22.5,
      impactLevel: 'alto',
      ecoProductCount: 1,
      receiptImagePath: 'assets/images/receipt_sample.jpg',
      scannedText: '',
    ),
    Receipt(
      id: '4',
      storeName: 'Wong',
      date: '28 Abr 2025',
      total: 45.20,
      co2: 5.1,
      impactLevel: 'verde',
      ecoProductCount: 4,
      receiptImagePath: 'assets/images/receipt_sample.jpg',
      scannedText: '',
    ),
  ];

  // Mapeo de nombres de tiendas a sus logos
  final Map<String, String> storeLogos = {
    'Tottus': 'assets/images/tottus_logo.png',
    'Plaza Vea': 'assets/images/plazavea_logo.png',
    'Metro': 'assets/images/metro_logo.png',
    'Wong': 'assets/images/wong_logo.png', // Reemplazar con logo correcto
  };

  @override
  Widget build(BuildContext context) {
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
                    final receipt = historyItems[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: RepaintBoundary( // Mejora el rendimiento al aislar la pintura
                        child: _buildHistoryItem(receipt),
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
    // Calcular los totales
    double totalCO2 = 0;
    int verdeCount = 0;
    int regularCount = 0;
    int altoCount = 0;
    
    for (final receipt in historyItems) {
      totalCO2 += receipt.co2;
      
      if (receipt.impactLevel == 'verde') {
        verdeCount++;
      } else if (receipt.impactLevel == 'regular') {
        regularCount++;
      } else if (receipt.impactLevel == 'alto') {
        altoCount++;
      }
    }

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
                  value: historyItems.length.toString(),
                  label: 'Compras',
                  icon: Icons.shopping_cart_outlined,
                ),
                _buildActivityStat(
                  value: verdeCount.toString(),
                  label: 'Ejemplares',
                  icon: Icons.eco_outlined,
                  color: verdeColor,
                ),
                _buildActivityStat(
                  value: '${totalCO2.toStringAsFixed(1)} Kg',
                  label: 'CO2 Total',
                  icon: Icons.cloud_outlined,
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Gráfico simplificado con colores mejorados
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: const Color(0xFFEEF6F6),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _buildImpactColumn(verdeCount, 'Ejemplar', verdeColor),
                  _buildImpactColumn(regularCount, 'Regular', regularColor),
                  _buildImpactColumn(altoCount, 'Alto impacto', altoColor),
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
    Color? color,
  }) {
    final Color iconColor = color ?? verdeColor;
    
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: iconColor,
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

  Widget _buildImpactColumn(int count, String label, Color color) {
    final double maxHeight = 50.0; // Altura máxima de la barra
    final double height = count > 0 ? (count / historyItems.length) * maxHeight : 5.0;
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 40,
          height: height.clamp(5.0, maxHeight),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '$count',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: Colors.black.withOpacity(0.7),
          ),
        ),
      ],
    );
  }

  Widget _buildHistoryItem(Receipt receipt) {
    // Obtener color según nivel de impacto con colores mejorados
    Color statusColor;
    Widget statusIcon;

    switch (receipt.impactLevel) {
      case 'verde':
        statusColor = verdeColor;
        statusIcon = const Icon(
          Icons.eco_outlined,
          color: Colors.white,
          size: 16,
        );
        break;
      case 'regular':
        statusColor = regularColor;
        statusIcon = const Icon(
          Icons.warning_amber_outlined,
          color: Colors.white,
          size: 16,
        );
        break;
      case 'alto':
        statusColor = altoColor;
        statusIcon = const Icon(
          Icons.dangerous_outlined,
          color: Colors.white,
          size: 16,
        );
        break;
      default:
        statusColor = Colors.grey;
        statusIcon = const Icon(
          Icons.help_outline,
          color: Colors.white,
          size: 16,
        );
    }

    // Obtener logo de la tienda
    final String? logoPath = storeLogos[receipt.storeName];

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
            // Encabezado con fecha, tienda y logo
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      // Logo de la tienda (si existe) o icono genérico
                      if (logoPath != null)
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              logoPath,
                              fit: BoxFit.contain,
                            ),
                          ),
                        )
                      else
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: verdeColor.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.receipt_long_rounded,
                            color: verdeColor,
                            size: 20,
                          ),
                        ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              receipt.date,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              receipt.storeName,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      statusIcon,
                      const SizedBox(width: 4),
                      Text(
                        receipt.impactLevel.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
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
                  value: '${receipt.co2.toStringAsFixed(1)} Kg',
                  icon: Icons.cloud_outlined,
                ),
                _buildPurchaseStat(
                  label: 'Calificación',
                  value: _getCalificationText(receipt.impactLevel),
                  icon: _getIconForImpactLevel(receipt.impactLevel),
                  color: _getColorForImpactLevel(receipt.impactLevel),
                ),
                _buildPurchaseStat(
                  label: 'Productos',
                  value: '7 items',
                  icon: Icons.shopping_bag_outlined,
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Botón para ver detalles
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ReceiptDetailView(
                      receipt: receipt, 
                      storeLogos: storeLogos
                    ),
                  ),
                );
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                side: BorderSide(color: verdeColor, width: 1.5),
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

  String _getCalificationText(String impactLevel) {
    switch (impactLevel) {
      case 'verde':
        return 'Ejemplar';
      case 'regular':
        return 'Regular';
      case 'alto':
        return 'Crítico';
      default:
        return 'No evaluado';
    }
  }

  Color _getColorForImpactLevel(String impactLevel) {
    switch (impactLevel) {
      case 'verde':
        return verdeColor;
      case 'regular':
        return regularColor;
      case 'alto':
        return altoColor;
      default:
        return Colors.grey;
    }
  }

  IconData _getIconForImpactLevel(String impactLevel) {
    switch (impactLevel) {
      case 'verde':
        return Icons.eco_outlined;
      case 'regular':
        return Icons.warning_amber_outlined;
      case 'alto':
        return Icons.dangerous_outlined;
      default:
        return Icons.help_outline;
    }
  }

  Widget _buildPurchaseStat({
    required String label,
    required String value,
    required IconData icon,
    Color? color,
  }) {
    final displayColor = color ?? Colors.black;
    
    return Column(
      children: [
        Icon(
          icon,
          size: 20,
          color: displayColor,
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: displayColor,
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
}