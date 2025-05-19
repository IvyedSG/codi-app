import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_theme.dart';

class AppBottomNavBar extends StatelessWidget {
  final int currentIndex;

  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    // Colores para la barra de navegación - más planos y simples
    final activeColor = AppTheme.primaryGreen; // Color activo - verde primario
    final backgroundColor = Colors.white; // Fondo siempre blanco
    final inactiveColor = Colors.black54; // Color inactivo

    return ConvexAppBar(
      backgroundColor: backgroundColor,
      activeColor: activeColor,
      color: inactiveColor,
      items: [
        // Home - Icono casa
        const TabItem(icon: Icons.home_rounded, title: 'Inicio'),

        // Results - Icono de estadísticas
        const TabItem(icon: Icons.insights_rounded, title: 'Promociones'),

        // Scan - Icono de cámara
        const TabItem(icon: Icons.camera_alt_rounded, title: 'Escanear'),

        // History - Icono de historial
        const TabItem(icon: Icons.history_rounded, title: 'Historial'),

        // Profile - Imagen circular en lugar de icono
        TabItem(
          icon: _buildProfileIcon(),
          title: 'Perfil',
        ),
      ],
      initialActiveIndex: currentIndex,
      onTap: (index) => _onItemTapped(context, index),
      style: TabStyle.fixedCircle, // Estilo con círculo para el icono central
      height: 60,
      cornerRadius: 0, // Sin esquinas redondeadas
      elevation: 2, // Sombra ligera
      top: -15, // Ajusta la posición del icono central
      curveSize: 70, // Tamaño de curva reducido
    );
  }

  // Widget para construir el icono de perfil con imagen circular
  Widget _buildProfileIcon() {
    return Container(
      width: 28,
      height: 28,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage('assets/images/foto.jpg'), // Ruta a tu imagen
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  void _onItemTapped(BuildContext context, int index) {
    if (currentIndex == index) return;

    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/results');
        break;
      case 2:
        context.go('/scan');
        break;
      case 3:
        context.go('/history');
        break;
      case 4:
        context.go('/profile');
        break;
    }
  }
}
