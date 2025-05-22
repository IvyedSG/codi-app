import 'package:flutter/material.dart';
import '../../../shared/widgets/app_bottom_nav_bar.dart';
import '../../../shared/widgets/animated_page_transition.dart';
import '../../../core/theme/app_theme.dart';
import 'all_promos_screen.dart'; // Make sure this path is correct and the class exists

class PromosScreen extends StatelessWidget {
  const PromosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF6F6), // Color #EEF6F6
      appBar: AppBar(
        backgroundColor: const Color(0xFFEEF6F6), // Color #EEF6F6
        elevation: 0,
        title: const Text(
          'Promociones',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: false,
        actions: [
          // Green receipt counter moved to app header
          Container(
            margin: const EdgeInsets.only(right: 8),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF1C6734).withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.eco_outlined,
                  size: 16,
                  color: Color(0xFF1C6734),
                ),
                SizedBox(width: 4),
                Text(
                  '7 recibos',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1C6734),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.black),
            onPressed: () {
              // Filtrar promociones
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
              // Banner principal 
              _buildMainPromoBanner(context),
              
              const SizedBox(height: 24),
              
              // Título sección destacados
              const Text(
                'Promociones destacadas',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              
              const SizedBox(height: 12),
              
              // Lista horizontal de promociones destacadas
              SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildFeaturedPromoCard(
                      'Descuento 20%',
                      'En todas las frutas y verduras',
                      'assets/images/tottus_logo.png',
                      Icons.shopping_bag_outlined,
                    ),
                    const SizedBox(width: 12),
                    _buildFeaturedPromoCard(
                      'Eco bolsa gratis',
                      'Por compras con recibos verdes',
                      'assets/images/plazavea_logo.png',
                      Icons.eco_outlined,
                    ),
                    const SizedBox(width: 12),
                    _buildFeaturedPromoCard(
                      '2x1 en productos',
                      'Seleccionados con etiqueta verde',
                      'assets/images/wong_logo.png',
                      Icons.local_offer_outlined,
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Título sección por recibos verdes - removed the counter from here
              Row(
                children: [
                  const Icon(Icons.eco_outlined, color: Color(0xFF1C6734), size: 24),
                  const SizedBox(width: 8),
                  const Text(
                    'Exclusivo para Recibos Verdes',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 12),
              
              // Lista de promociones por recibos verdes
              _buildGreenReceiptPromoCard(
                '1 Recibo Verde',
                'Descuento de S/10 en tu próxima compra',
                Icons.money_off_outlined,
              ),
              
              const SizedBox(height: 12),
              
              _buildGreenReceiptPromoCard(
                '2 Recibos Verdes',
                'Bolsa ecológica reutilizable',
                Icons.shopping_bag_outlined,
              ),
              
              const SizedBox(height: 12),
              
              _buildGreenReceiptPromoCard(
                '5 Recibos Verdes',
                'Productos orgánicos gratis',
                Icons.eco_outlined,
              ),
              
              const SizedBox(height: 24),
              
              // Título promociones por tiendas
              const Text(
                'Promociones por tiendas',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              
              const SizedBox(height: 12),
              
              // Lista de promociones por tiendas
              _buildStorePromoCard(
                'Supermercados Tottus',
                'Descuentos exclusivos en productos seleccionados',
                'assets/images/tottus_logo.png',
              ),
              
              const SizedBox(height: 12),
              
              _buildStorePromoCard(
                'Metro',
                '10% de descuento en productos eco-amigables',
                'assets/images/metro_logo.png',
              ),
              
              const SizedBox(height: 12),
              
              _buildStorePromoCard(
                'Plaza Vea',
                'Miércoles verde: 15% en productos orgánicos',
                'assets/images/plazavea_logo.png',
              ),
              
              // Espacio adicional para evitar que el último elemento quede pegado a la barra inferior
              const SizedBox(height: 28),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const AppBottomNavBar(currentIndex: 1),
    );
  }
  
  // Banner principal
  Widget _buildMainPromoBanner(BuildContext context) {
    return Container(
      height: 220, // Increased height to accommodate content
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF9AE1B7),
            const Color(0xFF9AE1B7).withOpacity(0.6),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            // Círculos decorativos
            Positioned(
              right: 20,
              top: 20,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
            Positioned(
              left: 20,
              bottom: 0,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
            
            // Contenido del banner
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min, // Added to prevent overflow
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.eco_outlined,
                        color: Color(0xFF1C6734),
                        size: 28,
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1C6734),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Text(
                          'NOVEDAD',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '¡Nuevas promociones!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Exclusivas para compras con recibos verdes',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 140,
                    height: 44,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const AllPromosScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Ver todos',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
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
  
  // Tarjeta de promoción destacada
  Widget _buildFeaturedPromoCard(String title, String description, String logoPath, IconData icon) {
    return Container(
      width: 180, // Reduced width to fit better on smaller screens
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Parte superior con icono
          Container(
            height: 90, // Slightly reduced height
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
                size: 40, // Slightly smaller icon
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
                    fontSize: 15, // Slightly smaller font
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
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  // Tarjeta de promoción por recibos verdes
  Widget _buildGreenReceiptPromoCard(String receipts, String description, IconData icon) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0), // Adjusted padding
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center, // Ensure vertical alignment
          children: [
            // Contenedor del icono con fondo verde
            Container(
              width: 45, // Slightly smaller
              height: 45, // Slightly smaller
              decoration: BoxDecoration(
                color: const Color(0xFF9AE1B7).withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  icon,
                  size: 24, // Smaller icon
                  color: const Color(0xFF1C6734),
                ),
              ),
            ),
            const SizedBox(width: 12), // Slightly smaller spacing
            // Textos
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min, // Prevent vertical overflow
                children: [
                  Row(
                    children: [
                      Text(
                        receipts,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.eco_outlined,
                        size: 16,
                        color: const Color(0xFF1C6734),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black.withOpacity(0.7),
                    ),
                    maxLines: 2, // Limit lines to prevent overflow
                    overflow: TextOverflow.ellipsis, // Handle text overflow
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8), // Reduced spacing
            // Botón de canjear
            SizedBox(
              width: 80, // Fixed width
              height: 36,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF9AE1B7),
                  foregroundColor: Colors.black,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.zero, // Remove padding to fit text
                ),
                child: const Text(
                  'Canjear',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  // Tarjeta de promoción por tienda
  Widget _buildStorePromoCard(String storeName, String description, String logoPath) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Logo de la tienda
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                logoPath,
                width: 50, // Smaller logo
                height: 50, // Smaller logo
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 16),
            // Textos
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min, // Prevent vertical overflow
                children: [
                  Text(
                    storeName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black.withOpacity(0.7),
                    ),
                    maxLines: 2, // Limit lines
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            // Flecha para ver más
            Icon(
              Icons.chevron_right,
              color: Colors.black.withOpacity(0.5),
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}