import 'package:flutter/material.dart';
import '../../../shared/widgets/app_bottom_nav_bar.dart';
import '../../../shared/widgets/animated_page_transition.dart';
import '../../../core/theme/app_theme.dart';

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
              _buildMainPromoBanner(),
              
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
                      'Por compras mayores a S/100',
                      'assets/images/tottus_logo.png',
                      Icons.eco_outlined,
                    ),
                    const SizedBox(width: 12),
                    _buildFeaturedPromoCard(
                      '2x1 en productos',
                      'Seleccionados con etiqueta verde',
                      'assets/images/tottus_logo.png',
                      Icons.local_offer_outlined,
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Título sección por puntos
              const Text(
                'Canjea tus CarboPuntos',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              
              const SizedBox(height: 12),
              
              // Lista de promociones por puntos
              _buildPointsPromoCard(
                '100 puntos',
                'Descuento de S/10 en tu próxima compra',
                Icons.money_off_outlined,
              ),
              
              const SizedBox(height: 12),
              
              _buildPointsPromoCard(
                '200 puntos',
                'Bolsa ecológica reutilizable',
                Icons.shopping_bag_outlined,
              ),
              
              const SizedBox(height: 12),
              
              _buildPointsPromoCard(
                '500 puntos',
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
                'assets/images/tottus_logo.png', // Aquí iría el logo de Metro
              ),
              
              const SizedBox(height: 12),
              
              _buildStorePromoCard(
                'Plaza Vea',
                'Miércoles verde: 15% en productos orgánicos',
                'assets/images/tottus_logo.png', // Aquí iría el logo de Plaza Vea
              ),
              
              // Espacio adicional para evitar que el último elemento quede pegado a la barra inferior
              const SizedBox(height: 28), // Aumentado para evitar cualquier overflow
            ],
          ),
        ),
      ),
      bottomNavigationBar: const AppBottomNavBar(currentIndex: 1),
    );
  }
  
  // Banner principal corregido para mostrar completamente el botón
  Widget _buildMainPromoBanner() {
    return Container(
      height: 200, // Aumentada la altura para dar más espacio al botón
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF9AE1B7), // Color #9AE1B7
            const Color(0xFF9AE1B7).withOpacity(0.8),
            const Color(0xFF9AE1B7).withOpacity(0.6),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            // Círculos decorativos ahora con mejor posicionamiento
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
              bottom: 0, // Ajustado para no interferir con el botón
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
            
            // Contenido del banner con mejor distribución
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '¡Nuevos descuentos!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Obtén beneficios por tus compras ecológicas',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 20), // Más espacio antes del botón
                  Container(
                    width: 140,
                    height: 44, // Altura aumentada para mejor visualización
                    margin: const EdgeInsets.only(bottom: 4), // Margen inferior para evitar cortes
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22), // Bordes más redondeados
                        ),
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                      ),
                      child: const Text(
                        'Ver todos',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
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
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Parte superior con icono
          Container(
            height: 100,
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
                size: 50,
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
                    fontSize: 16,
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
  
  // Tarjeta de promoción por puntos
  Widget _buildPointsPromoCard(String points, String description, IconData icon) {
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
            // Contenedor del icono con fondo verde
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFF9AE1B7).withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  icon,
                  size: 28,
                  color: const Color(0xFF1C6734),
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Textos
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    points,
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
                  ),
                ],
              ),
            ),
            // Botón de canjear
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF9AE1B7),
                foregroundColor: Colors.black,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                minimumSize: const Size(80, 36),
              ),
              child: const Text(
                'Canjear',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
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
                width: 60,
                height: 60,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 16),
            // Textos
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  ),
                ],
              ),
            ),
            // Flecha para ver más
            Icon(
              Icons.chevron_right,
              color: Colors.black.withOpacity(0.5),
            ),
          ],
        ),
      ),
    );
  }
}