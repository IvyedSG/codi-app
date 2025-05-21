import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/app_bottom_nav_bar.dart';
import '../../../shared/widgets/animated_page_transition.dart';
import '../../../core/theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF6F6), // Color #EEF6F6 consistente
      appBar: AppBar(
        backgroundColor: const Color(0xFFEEF6F6),
        elevation: 0,
        title: const Text(
          'Perfil',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: Colors.black),
            onPressed: () {
              // Navegar a configuración
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
              // Tarjeta de información del usuario
              _buildUserInfoCard(),
              
              const SizedBox(height: 24),
              
              // Tarjeta de estadísticas de carbono
              _buildCarbonStatsCard(),
              
              const SizedBox(height: 24),
              
              // Sección de premios y logros
              const Text(
                'Logros',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Tarjeta de logros
              _buildAchievementsCard(),
              
              const SizedBox(height: 24),
              
              // Opciones de perfil
              const Text(
                'Configuración',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Tarjeta de opciones
              _buildOptionsCard(context),
              
              // Espacio adicional al final
              const SizedBox(height: 28),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const AppBottomNavBar(currentIndex: 4),
    );
  }

  Widget _buildUserInfoCard() {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            // Foto de perfil
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFF9AE1B7),
                  width: 3,
                ),
                image: const DecorationImage(
                  image: AssetImage('assets/images/foto.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 20),
            // Información del usuario
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Juan Pérez',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'juan.perez@gmail.com',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 8),
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
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.eco_outlined,
                          size: 14,
                          color: Color(0xFF1C6734),
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Usuario Eco',
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
            ),
            // Botón de editar
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFF9AE1B7).withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.edit_outlined,
                  size: 20,
                  color: Color(0xFF1C6734),
                ),
                onPressed: () {
                  // Editar perfil
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarbonStatsCard() {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Resumen de Impacto Ambiental',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Estadísticas con íconos y valores
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCarbonStat(
                  icon: Icons.cloud_outlined,
                  value: '45.8',
                  unit: 'Kg CO₂',
                  label: 'Total emitido',
                ),
                _buildCarbonStat(
                  icon: Icons.eco_outlined,
                  value: '7',
                  unit: 'recibos',
                  label: 'Recibos Verdes',
                  isHighlighted: true,
                ),
                _buildCarbonStat(
                  icon: Icons.receipt_long_rounded,
                  value: '12',
                  unit: 'escaneos',
                  label: 'Este mes',
                ),
              ],
            ),
            
            const SizedBox(height: 20),
            
            // Porcentaje de recibos verdes
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Recibos verdes vs. regulares',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '58%',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1C6734),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: 0.58,
                    backgroundColor: const Color(0xFF9AE1B7).withOpacity(0.2),
                    valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF9AE1B7)),
                    minHeight: 8,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarbonStat({
    required IconData icon,
    required String value,
    required String unit,
    required String label,
    bool isHighlighted = false,
  }) {
    final color = isHighlighted ? const Color(0xFF1C6734) : Colors.black;
    
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
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: value,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              TextSpan(
                text: '\n$unit',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.black.withOpacity(0.7),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildAchievementsCard() {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Mis logros',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Ver todos',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF1C6734),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Lista horizontal de logros
            SizedBox(
              height: 110,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildAchievementItem(
                    icon: Icons.eco_outlined,
                    title: 'Eco-Novato',
                    description: 'Primer mes usando la app',
                    isCompleted: true,
                  ),
                  const SizedBox(width: 12),
                  _buildAchievementItem(
                    icon: Icons.receipt_long_rounded,
                    title: 'Scanner Pro',
                    description: '10 facturas escaneadas',
                    isCompleted: true,
                  ),
                  const SizedBox(width: 12),
                  _buildAchievementItem(
                    icon: Icons.shopping_bag_outlined,
                    title: 'Comprador Verde',
                    description: '5 compras eco-amigables',
                    isCompleted: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAchievementItem({
    required IconData icon,
    required String title,
    required String description,
    required bool isCompleted,
  }) {
    return Container(
      width: 130,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isCompleted 
            ? const Color(0xFF9AE1B7).withOpacity(0.2)
            : Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 28,
            color: isCompleted 
                ? const Color(0xFF1C6734)
                : Colors.grey,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isCompleted 
                  ? Colors.black
                  : Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 2),
          Text(
            description,
            style: TextStyle(
              fontSize: 10,
              color: isCompleted 
                  ? Colors.black.withOpacity(0.7)
                  : Colors.grey,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildOptionsCard(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _buildOptionItem(
            icon: Icons.person_outline,
            title: 'Datos personales',
            onTap: () {},
          ),
          const Divider(height: 1, indent: 16, endIndent: 16),
          _buildOptionItem(
            icon: Icons.notifications_outlined,
            title: 'Notificaciones',
            onTap: () {},
          ),
          const Divider(height: 1, indent: 16, endIndent: 16),
          _buildOptionItem(
            icon: Icons.security_outlined,
            title: 'Privacidad y seguridad',
            onTap: () {},
          ),
          const Divider(height: 1, indent: 16, endIndent: 16),
          _buildOptionItem(
            icon: Icons.help_outline,
            title: 'Ayuda y soporte',
            onTap: () {},
          ),
          const Divider(height: 1, indent: 16, endIndent: 16),
          _buildOptionItem(
            icon: Icons.logout,
            title: 'Cerrar sesión',
            textColor: Colors.red,
            iconColor: Colors.red,
            onTap: () {
              context.go('/login');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildOptionItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? textColor,
    Color? iconColor,
  }) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: (iconColor == null)
              ? const Color(0xFF9AE1B7).withOpacity(0.2)
              : iconColor.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: iconColor ?? const Color(0xFF1C6734),
          size: 20,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: textColor ?? Colors.black,
        ),
      ),
      trailing: Icon(
        Icons.chevron_right,
        color: textColor ?? Colors.black.withOpacity(0.5),
        size: 20,
      ),
      onTap: onTap,
    );
  }
}