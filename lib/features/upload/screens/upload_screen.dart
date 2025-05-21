import 'package:flutter/material.dart';
import '../../../shared/widgets/app_bottom_nav_bar.dart';
import '../../../core/theme/app_theme.dart';
import 'package:go_router/go_router.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF6F6), // Fondo #EEF6F6 consistente
      appBar: AppBar(
        backgroundColor: const Color(0xFFEEF6F6),
        elevation: 0,
        title: const Text(
          'Subir Factura',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Texto explicativo
            const Text(
              'Toma una foto de tu factura para calcular tu huella de carbono',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Vista previa de la cámara con mejor diseño
            Container(
              width: double.infinity,
              height: 400, // Mayor altura para mejor visualización
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                    // Fondo decorativo con degradado 
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.grey.withOpacity(0.1),
                            Colors.grey.withOpacity(0.2),
                          ],
                        ),
                      ),
                    ),
                    
                    // Contenido centrado
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Icono de cámara con fondo circular
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: const Color(0xFF9AE1B7).withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.camera_alt_outlined,
                              size: 40,
                              color: Color(0xFF1C6734),
                            ),
                          ),
                          
                          const SizedBox(height: 24),
                          
                          const Text(
                            'Vista Previa',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          
                          const SizedBox(height: 12),
                          
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Text(
                              'Posiciona la factura dentro del marco para obtener el mejor resultado',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black.withOpacity(0.7),
                              ),
                            ),
                          ),
                          
                          const SizedBox(height: 24),
                          
                          // Marco guía para la factura
                          Container(
                            width: 200,
                            height: 120,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFF9AE1B7),
                                width: 2,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                'Alinea aquí',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    // Esquinas indicadoras
                    Positioned(
                      top: 40,
                      left: 40,
                      child: _buildCorner(CornerPosition.topLeft),
                    ),
                    Positioned(
                      top: 40,
                      right: 40,
                      child: _buildCorner(CornerPosition.topRight),
                    ),
                    Positioned(
                      bottom: 40,
                      left: 40,
                      child: _buildCorner(CornerPosition.bottomLeft),
                    ),
                    Positioned(
                      bottom: 40,
                      right: 40,
                      child: _buildCorner(CornerPosition.bottomRight),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Botones de acción
            Row(
              children: [
                // Botón Galería
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      // Seleccionar imagen de la galería
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: const BorderSide(color: Color(0xFF1C6734), width: 1.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    icon: const Icon(
                      Icons.photo_library_outlined,
                      size: 20,
                    ),
                    label: const Text(
                      'Galería',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(width: 16),
                
                // Botón Capturar
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      _showScanningDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 0,
                    ),
                    icon: const Icon(
                      Icons.camera_alt_rounded,
                      size: 20,
                    ),
                    label: const Text(
                      'Capturar',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Tips para mejorar el escaneo
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF9AE1B7).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Tips para mejorar el escaneo',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildTipItem(
                    'Buena iluminación para mejores resultados',
                    Icons.wb_sunny_outlined,
                  ),
                  const SizedBox(height: 8),
                  _buildTipItem(
                    'Evita sombras sobre la factura',
                    Icons.wb_shade,
                  ),
                  const SizedBox(height: 8),
                  _buildTipItem(
                    'Mantén la factura plana y sin arrugas',
                    Icons.crop_free,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNavBar(currentIndex: 2),
    );
  }

  // Widget para crear las esquinas guía
  Widget _buildCorner(CornerPosition position) {
    return SizedBox(
      width: 20,
      height: 20,
      child: CustomPaint(
        painter: CornerPainter(position: position),
      ),
    );
  }
  
  // Widget para crear elementos de tip con iconos
  Widget _buildTipItem(String text, IconData icon) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 18,
          color: const Color(0xFF1C6734),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
        ),
      ],
    );
  }

  // Diálogo de escaneo mejorado
  void _showScanningDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: Container(
          width: 240,
          height: 240,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Contenedor con ícono animado
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: const Color(0xFF9AE1B7).withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF1C6734)),
                      backgroundColor: const Color(0xFF9AE1B7).withOpacity(0.3),
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 28),
              
              const Text(
                'Escaneando Factura',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              
              const SizedBox(height: 12),
              
              Text(
                'Procesando tu información...',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    
    // Simular tiempo de procesamiento y luego cerrar el diálogo
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pop();
      // Navegar a la página de promos
      context.go('/promos');
    });
  }
}

// Enum para las posiciones de las esquinas
enum CornerPosition { topLeft, topRight, bottomLeft, bottomRight }

// Painter personalizado para dibujar las esquinas guía
class CornerPainter extends CustomPainter {
  final CornerPosition position;
  
  CornerPainter({required this.position});
  
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF9AE1B7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;
    
    const length = 12.0;
    
    switch (position) {
      case CornerPosition.topLeft:
        canvas.drawLine(Offset.zero, const Offset(length, 0), paint);
        canvas.drawLine(Offset.zero, const Offset(0, length), paint);
        break;
      case CornerPosition.topRight:
        canvas.drawLine(Offset(size.width, 0), Offset(size.width - length, 0), paint);
        canvas.drawLine(Offset(size.width, 0), Offset(size.width, length), paint);
        break;
      case CornerPosition.bottomLeft:
        canvas.drawLine(Offset(0, size.height), Offset(length, size.height), paint);
        canvas.drawLine(Offset(0, size.height), Offset(0, size.height - length), paint);
        break;
      case CornerPosition.bottomRight:
        canvas.drawLine(Offset(size.width, size.height), Offset(size.width - length, size.height), paint);
        canvas.drawLine(Offset(size.width, size.height), Offset(size.width, size.height - length), paint);
        break;
    }
  }
  
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}