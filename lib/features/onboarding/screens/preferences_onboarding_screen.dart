import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';
import '../widgets/onboarding_progress_indicator.dart';

class PreferencesOnboardingScreen extends StatefulWidget {
  const PreferencesOnboardingScreen({super.key});

  @override
  State<PreferencesOnboardingScreen> createState() => _PreferencesOnboardingScreenState();
}

class _PreferencesOnboardingScreenState extends State<PreferencesOnboardingScreen> {
  // Controlador para el PageView
  final PageController _pageController = PageController();
  
  // Página actual para el indicador de progreso
  int _currentPage = 0;
  
  // Selected goals - can be multiple
  List<String> selectedGoals = [];
  // Selected lifestyle - single selection
  String? selectedLifestyle;
  // Ingredients to avoid - can be multiple
  List<String> selectedIngredientsToAvoid = [];

  // Preference data
  final Map<String, Map<String, String>> allPreferences = {
    'goals': {
      'perder_peso': 'Quiero perder peso de forma saludable',
      'ganar_masa_muscular': 'Estoy buscando aumentar mi masa muscular',
      'mantener_peso': 'Solo quiero mantener un peso saludable',
      'evitar_procesados': 'Quiero reducir mi consumo de alimentos ultraprocesados',
      'alimentacion_balanceada': 'Busco una alimentación variada y equilibrada'
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
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Guardar preferencias y navegar a la página principal
      _savePreferencesAndNavigate();
    }
  }

  // Método para omitir la página actual
  void _skipCurrentPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Si estamos en la última página, guardar y navegar
      _savePreferencesAndNavigate();
    }
  }

  // Método para omitir todo el onboarding
  void _skipAllOnboarding() {
    // Aquí podríamos establecer valores predeterminados para las preferencias
    // o simplemente dejarlas vacías
    _savePreferencesAndNavigate();
  }

  void _savePreferencesAndNavigate() {
    // Aquí se enviarían las preferencias al servidor
    // Para simplificar, solo navegamos a la página principal
    context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF6F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFEEF6F6),
        elevation: 0,
        title: const Text(
          'Personaliza tu experiencia',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Indicador de progreso
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: OnboardingProgressIndicator(currentStep: _currentPage, totalSteps: 3),
            ),
            
            const SizedBox(height: 16),
            
            // Contenido principal
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: [
                  // Página 1: Objetivos personales
                  _buildGoalsPage(),
                  
                  // Página 2: Estilo de vida
                  _buildLifestylePage(),
                  
                  // Página 3: Ingredientes a evitar
                  _buildIngredientsPage(),
                ],
              ),
            ),
            
            // Botones de acción (mantenemos el botón "Omitir" para cada pregunta)
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                children: [
                  // Botón para omitir la pregunta actual
                  Expanded(
                    flex: 1,
                    child: OutlinedButton(
                      onPressed: _skipCurrentPage,
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.black38),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text(
                        'Omitir',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(width: 12),
                  
                  // Botón de siguiente/finalizar
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: _nextPage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: Text(
                        _currentPage == 2 ? 'Comenzar' : 'Siguiente',
                        style: const TextStyle(
                          fontSize: 16,
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

  Widget _buildGoalsPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título e icono
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF9AE1B7).withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.flag_outlined,
                  size: 24,
                  color: Color(0xFF1C6734),
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                '¿Cuáles son tus objetivos?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 12),
          
          // Descripción
          Text(
            'Selecciona uno o varios objetivos para personalizar recomendaciones',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Opciones de objetivos
          ...allPreferences['goals']!.entries.map((entry) {
            return _buildMultiSelectionCard(
              text: entry.value,
              isSelected: selectedGoals.contains(entry.key),
              onTap: () {
                setState(() {
                  if (selectedGoals.contains(entry.key)) {
                    selectedGoals.remove(entry.key);
                  } else {
                    selectedGoals.add(entry.key);
                  }
                });
              },
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildLifestylePage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título e icono
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF9AE1B7).withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.eco_outlined,
                  size: 24,
                  color: Color(0xFF1C6734),
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                '¿Cuál es tu estilo de vida?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 12),
          
          // Descripción
          Text(
            'Selecciona la opción que mejor represente tus valores personales',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Opciones de estilos de vida
          ...allPreferences['lifestyles']!.entries.map((entry) {
            return _buildSingleSelectionCard(
              text: entry.value,
              isSelected: selectedLifestyle == entry.key,
              onTap: () {
                setState(() {
                  selectedLifestyle = entry.key;
                });
              },
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildIngredientsPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título e icono
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF9AE1B7).withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.do_not_disturb_alt_outlined,
                  size: 24,
                  color: Color(0xFF1C6734),
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                '¿Qué ingredientes evitas?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 12),
          
          // Descripción
          Text(
            'Selecciona los ingredientes o componentes que prefieres no consumir',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Opciones de ingredientes a evitar
          ...allPreferences['ingredientsToAvoid']!.entries.map((entry) {
            return _buildMultiSelectionCard(
              text: entry.value,
              isSelected: selectedIngredientsToAvoid.contains(entry.key),
              onTap: () {
                setState(() {
                  if (selectedIngredientsToAvoid.contains(entry.key)) {
                    selectedIngredientsToAvoid.remove(entry.key);
                  } else {
                    selectedIngredientsToAvoid.add(entry.key);
                  }
                });
              },
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildMultiSelectionCard({
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? const Color(0xFF1C6734) : Colors.grey.withOpacity(0.2),
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    color: Colors.black.withOpacity(isSelected ? 0.9 : 0.7),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? const Color(0xFF1C6734) : Colors.grey,
                    width: 2,
                  ),
                  color: isSelected ? const Color(0xFF1C6734) : Colors.white,
                ),
                child: isSelected
                    ? const Icon(
                        Icons.check,
                        size: 16,
                        color: Colors.white,
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSingleSelectionCard({
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? const Color(0xFF1C6734) : Colors.grey.withOpacity(0.2),
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    color: Colors.black.withOpacity(isSelected ? 0.9 : 0.7),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? const Color(0xFF1C6734) : Colors.grey,
                    width: 2,
                  ),
                  color: isSelected ? const Color(0xFF1C6734) : Colors.white,
                ),
                child: isSelected
                    ? const Icon(
                        Icons.check,
                        size: 16,
                        color: Colors.white,
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}