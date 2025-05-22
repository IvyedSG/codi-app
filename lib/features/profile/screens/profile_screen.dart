import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/app_bottom_nav_bar.dart';
import '../../../shared/widgets/animated_page_transition.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Mock user data - in a real app this would come from a user service
  String userName = "Juan Pérez";
  String userEmail = "juan.perez@gmail.com";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF6F6),
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
                  Text(
                    userName,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    userEmail,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black.withOpacity(0.7),
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
                  _editUserName();
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
            icon: Icons.tune,
            title: 'Preferencias de consumo',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const PreferenciasScreen(),
                ),
              );
            },
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
  
  void _editUserName() {
    // Controller for text input
    final TextEditingController controller = TextEditingController(text: userName);
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Editar nombre'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'Ingresa tu nombre',
            ),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancelar',
                style: TextStyle(color: Colors.grey[700]),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  userName = controller.text;
                });
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1C6734),
              ),
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }
}

// New screen for preferences
class PreferenciasScreen extends StatefulWidget {
  const PreferenciasScreen({super.key});

  @override
  State<PreferenciasScreen> createState() => _PreferenciasScreenState();
}

class _PreferenciasScreenState extends State<PreferenciasScreen> {
  // Selected goals - can be multiple
  List<String> selectedGoals = ['perder_peso', 'evitar_procesados'];
  // Selected lifestyle - usually single selection but can be multiple
  List<String> selectedLifestyles = ['prioriza_local'];
  // Ingredients to avoid - can be multiple
  List<String> selectedIngredientsToAvoid = ['evitar_azucar', 'evitar_conservantes'];

  // Preference data
  final Map<String, Map<String, String>> allPreferences = {
    'goals': {
      'perder_peso': 'Quiero perder peso de forma saludable',
      'ganar_masa_muscular': 'Estoy buscando aumentar mi masa muscular',
      'mantener_peso': 'Solo quiero mantener un peso saludable',
      'evitar_procesados': 'Quiero reducir mi consumo de alimentos ultraprocesados',
      'alimentacion_balanceada': 'Busco una alimentación variada y equilibrada',
    },
    'lifestyles': {
      'vegano': 'Solo consumo productos 100% de origen vegetal',
      'vegetariano': 'No consumo carne, pero sí huevos y lácteos',
      'cero_residuos': 'Busco reducir al máximo el empaque y residuos',
      'prioriza_local': 'Prefiero productos cultivados o elaborados en Perú',
      'solo_organico': 'Solo quiero productos certificados como orgánicos',
    },
    'ingredientsToAvoid': {
      'evitar_azucar': 'Evito productos con azúcar añadida',
      'evitar_gluten': 'No consumo productos con gluten',
      'evitar_lactosa': 'Prefiero productos sin lactosa',
      'evitar_conservantes': 'Evito productos con conservantes o aditivos artificiales',
      'evitar_soya': 'No consumo productos derivados de soya',
    },
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF6F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFEEF6F6),
        elevation: 0,
        title: const Text(
          'Preferencias de consumo',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Explanation text
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF9AE1B7).withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Personaliza tus preferencias para recibir recomendaciones más acordes a tus necesidades y valores personales.',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF1C6734),
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Objetivos personales section
            _buildSectionTitle('🎯 Objetivos personales de consumo'),
            const SizedBox(height: 8),
            _buildPreferenceSection(
              preferences: allPreferences['goals']!,
              selectedValues: selectedGoals,
              onChanged: (key, value) {
                setState(() {
                  if (value) {
                    if (!selectedGoals.contains(key)) {
                      selectedGoals.add(key);
                    }
                  } else {
                    selectedGoals.remove(key);
                  }
                });
              },
            ),
            
            const SizedBox(height: 24),
            
            // Estilo de vida section
            _buildSectionTitle('🌱 Estilo de vida y valores personales'),
            const SizedBox(height: 4),
            const Text(
              'Selecciona una opción principal',
              style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            _buildPreferenceSection(
              preferences: allPreferences['lifestyles']!,
              selectedValues: selectedLifestyles,
              onChanged: (key, value) {
                setState(() {
                  if (value) {
                    selectedLifestyles = [key]; // Single selection
                  } else {
                    selectedLifestyles.remove(key);
                  }
                });
              },
              singleSelect: true,
            ),
            
            const SizedBox(height: 24),
            
            // Ingredientes a evitar section
            _buildSectionTitle('⛔ Ingredientes o componentes a evitar'),
            const SizedBox(height: 8),
            _buildPreferenceSection(
              preferences: allPreferences['ingredientsToAvoid']!,
              selectedValues: selectedIngredientsToAvoid,
              onChanged: (key, value) {
                setState(() {
                  if (value) {
                    if (!selectedIngredientsToAvoid.contains(key)) {
                      selectedIngredientsToAvoid.add(key);
                    }
                  } else {
                    selectedIngredientsToAvoid.remove(key);
                  }
                });
              },
            ),
            
            const SizedBox(height: 40),
            
            // Save button with black design
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Save preferences and go back
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Preferencias guardadas correctamente'),
                      backgroundColor: Colors.black,
                    ),
                  );
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Guardar preferencias',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  Widget _buildPreferenceSection({
    required Map<String, String> preferences,
    required List<String> selectedValues,
    required Function(String, bool) onChanged,
    bool singleSelect = false,
  }) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: preferences.entries.map((entry) {
            bool isSelected = selectedValues.contains(entry.key);
            
            return _buildPreferenceItem(
              title: entry.value,
              isSelected: isSelected,
              onChanged: (value) => onChanged(entry.key, value),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildPreferenceItem({
    required String title,
    required bool isSelected,
    required Function(bool) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Switch(
            value: isSelected,
            onChanged: onChanged,
            activeColor: const Color(0xFF1C6734),
            activeTrackColor: const Color(0xFF9AE1B7),
          ),
        ],
      ),
    );
  }
}