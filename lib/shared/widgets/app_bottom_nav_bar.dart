import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBottomNavBar extends StatelessWidget {
  final int currentIndex;

  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
  });

  // Llave de navegación global para acceder al contexto
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    // Colores para la barra de navegación
    final activeColor = const Color(0xFF9AE1B7); // Color exacto #9AE1B7 para activo
    final inactiveColor = Colors.black; // Color negro para inactivo
    final backgroundColor = Colors.white; // Fondo blanco

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      height: 70, // Altura para textos
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Home - Icono casa
          _buildNavItem(
            icon: Icons.home_rounded,
            index: 0,
            activeColor: activeColor,
            inactiveColor: inactiveColor,
            label: 'Inicio',
          ),

          // Promociones - Icono de porcentaje/descuentos
          _buildNavItem(
            icon: Icons.percent_rounded,
            index: 1,
            activeColor: activeColor,
            inactiveColor: inactiveColor,
            label: 'Promos',
          ),

          // Subir - Icono de cámara
          _buildNavItem(
            icon: Icons.camera_alt_rounded,
            index: 2,
            activeColor: activeColor,
            inactiveColor: inactiveColor,
            label: 'Subir',
          ),

          // History - Icono de historial
          _buildNavItem(
            icon: Icons.receipt_long_rounded,
            index: 3,
            activeColor: activeColor,
            inactiveColor: inactiveColor,
            label: 'Historial',
          ),

          // Profile - Icono de perfil
          _buildNavItem(
            icon: Icons.person_rounded,
            index: 4,
            activeColor: activeColor,
            inactiveColor: inactiveColor,
            isProfileImage: true,
            label: 'Perfil',
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required int index,
    required Color activeColor,
    required Color inactiveColor,
    required String label,
    bool isProfileImage = false,
  }) {
    final isSelected = currentIndex == index;
    final color = isSelected ? activeColor : inactiveColor;

    // Tamaños consistentes para todos los elementos
    const double iconSize = 24.0;       // Tamaño exacto para todos los iconos
    const double containerSize = 32.0;  // Tamaño exacto para todos los contenedores
    const double fontSize = 10.0;       // Tamaño exacto para todos los textos
    const double spacing = 2.0;         // Espaciado entre icono y texto

    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _onItemTapped(index),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Si es el icono de perfil, mostramos la imagen con borde del color activo
              if (isProfileImage)
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOutCubic,
                  width: containerSize,
                  height: containerSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: isSelected 
                      ? Border.all(color: activeColor, width: 2)
                      : null,
                    image: const DecorationImage(
                      image: AssetImage('assets/images/foto.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              else
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOutCubic,
                  height: containerSize,
                  width: containerSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected ? activeColor.withOpacity(0.2) : Colors.transparent,
                  ),
                  child: Icon(
                    icon,
                    color: color,
                    size: iconSize,
                  ),
                ),
              SizedBox(height: spacing),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 300),
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: color,
                ),
                child: Text(label),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    if (currentIndex == index) return;

    switch (index) {
      case 0:
        navigateTo('/home');
        break;
      case 1:
        navigateTo('/promos');
        break;
      case 2:
        navigateTo('/upload');
        break;
      case 3:
        navigateTo('/history');
        break;
      case 4:
        navigateTo('/profile');
        break;
    }
  }

  // Método de navegación que realiza la transición instantánea
  void navigateTo(String route) {
    BuildContext? context = navigatorKey.currentContext;
    if (context != null) {
      GoRouter.of(context).go(route);
    }
  }
}
