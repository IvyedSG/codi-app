import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/app_bottom_nav_bar.dart';
import '../widgets/camera_preview_widget.dart';
import '../widgets/standard_item_widget.dart';
import '../widgets/tip_item_widget.dart';
import '../widgets/receipt_view_widget.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;
  bool _isLoading = false;
  bool _uploadComplete = false;
  final Map<String, String> _receiptData = {
    'store': 'Tottus', 
    'date': '22/05/2025',
    'total': '120.00',
    'co2': '6.0',
    'isGreen': 'true',
    'ecoProducts': '3',
  };

  // Método para obtener imagen de la cámara
  Future<void> _getImageFromCamera() async {
    setState(() {
      _isLoading = true;
    });

    final XFile? photo = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
      preferredCameraDevice: CameraDevice.rear,
    );

    if (photo != null) {
      _processImage(File(photo.path));
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Método para obtener imagen de la galería
  Future<void> _getImageFromGallery() async {
    setState(() {
      _isLoading = true;
    });

    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image != null) {
      _processImage(File(image.path));
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Método simplificado para procesar la imagen (sin OCR)
  Future<void> _processImage(File imageFile) async {
    // Simular un breve tiempo de carga para mejorar UX
    setState(() {
      _isLoading = true;
    });
    
    try {
      // Aquí enviaríamos la imagen al servidor para su procesamiento
      // y recibiríamos el resultado incluyendo un ID único de recibo
      await Future.delayed(const Duration(seconds: 1));
      
      setState(() {
        _imageFile = imageFile;
        _isLoading = false;
        _uploadComplete = true;
        // En un caso real, los datos vendrían del servidor
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
        // Mostrar error
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF6F6),
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
      // Si estamos mostrando resultados, no mostrar la barra de navegación
      body: _uploadComplete ? _buildResultsScreen() : _buildScanScreen(),
      // Solo mostrar la barra de navegación en la pantalla de subida inicial
      bottomNavigationBar: _uploadComplete ? null : const AppBottomNavBar(currentIndex: 2),
    );
  }

  // Widget para pantalla de subida mejorado
  Widget _buildScanScreen() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Información sobre recibos verdes con botón de info
          _buildCompactGreenReceiptInfo(),
          
          const SizedBox(height: 24),
          
          // Indicaciones para tomar la foto
          const Text(
            'Toma una foto de tu factura',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          
          const SizedBox(height: 8),
          
          const Text(
            'Captura la imagen de tu boleta para calcular la huella de carbono',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Vista previa de la cámara
          CameraPreviewWidget(imageFile: _imageFile),
          
          const SizedBox(height: 24),
          
          // Botones de acción
          _buildActionButtons(),
          
          const SizedBox(height: 24),
          
          // Solo la advertencia sobre registro de recibos
          _buildReceiptPolicyWarning(),
        ],
      ),
    );
  }

  // Sección compacta de información sobre recibos verdes con botón de info
  Widget _buildCompactGreenReceiptInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.eco_outlined,
                  size: 20,
                  color: Color(0xFF1C6734),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Recibo Verde',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1C6734),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                _showGreenReceiptStandardsDialog(context);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF1C6734).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Text(
                      'Más info',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1C6734),
                      ),
                    ),
                    SizedBox(width: 2),
                    Icon(
                      Icons.info_outline,
                      size: 14,
                      color: Color(0xFF1C6734),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'Los recibos verdes representan compras con menor impacto ambiental.',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black.withOpacity(0.7),
          ),
        ),
      ],
    );
  }
  
  // Widget para mostrar estándares de forma compacta
  Widget _buildCompactStandard(String text, IconData icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
        decoration: BoxDecoration(
          color: const Color(0xFF9AE1B7).withOpacity(0.15),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 16,
              color: const Color(0xFF1C6734),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1C6734),
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  // Diálogo para mostrar los estándares completos
  void _showGreenReceiptStandardsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(
              Icons.eco_outlined,
              color: Color(0xFF1C6734),
              size: 24,
            ),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                'Estándares para Recibo Verde',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StandardItemWidget(
                text: 'Más del 50% de productos eco-amigables',
                icon: Icons.check_circle_outline,
              ),
              const SizedBox(height: 12),
              StandardItemWidget(
                text: 'Presencia de bolsas reutilizables en vez de plástico',
                icon: Icons.check_circle_outline,
              ),
              const SizedBox(height: 12),
              StandardItemWidget(
                text: 'Productos de temporada local con menor transporte',
                icon: Icons.check_circle_outline,
              ),
              const SizedBox(height: 12),
              StandardItemWidget(
                text: 'Productos frescos en vez de ultraprocesados',
                icon: Icons.check_circle_outline,
              ),
              const SizedBox(height: 12),
              StandardItemWidget(
                text: 'Empaques biodegradables o reciclables',
                icon: Icons.check_circle_outline,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Entendido'),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
  
  // Widget para mostrar solo la advertencia de política de recibos
  Widget _buildReceiptPolicyWarning() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.amber.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.amber.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline, size: 18, color: Colors.amber.shade800),
          const SizedBox(width: 8),
          const Expanded(
            child: Text(
              'Todos los recibos escaneados son analizados y contribuyen a tus estadísticas de impacto ambiental, para generar recomendaciones personalizadas.',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget para mostrar los resultados con recibo digital detallado
  Widget _buildResultsScreen() {
    final bool isGreen = _receiptData['isGreen'] == 'true';
    final String co2 = _receiptData['co2'] ?? '0.00';
    final String store = _receiptData['store'] ?? 'Tienda no identificada';
    final String date = _receiptData['date'] ?? 'Fecha no identificada';
    final String total = _receiptData['total'] ?? '0.00';
    final String ecoProducts = _receiptData['ecoProducts'] ?? '0';

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título de resultados
          const Text(
            'Tu compra ha sido analizada',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Vista previa de la imagen subida
          if (_imageFile != null)
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.file(
                  _imageFile!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          
          const SizedBox(height: 24),
          
          // Recibo Digital con formato de recibo físico
          ReceiptViewWidget(
            store: store,
            date: date,
            total: total,
            co2: co2,
            ecoProducts: ecoProducts,
            isGreen: isGreen,
          ),
          
          const SizedBox(height: 32),
          
          // Único botón para volver
          _buildResultActionButtons(),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        // Botón Galería
        Expanded(
          child: OutlinedButton.icon(
            onPressed: _isLoading ? null : _getImageFromGallery,
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
            onPressed: _isLoading ? null : _getImageFromCamera,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 0,
            ),
            icon: _isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : const Icon(
                    Icons.camera_alt_rounded,
                    size: 20,
                  ),
            label: Text(
              _isLoading ? 'Procesando...' : 'Capturar',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Cambiar el método _buildResultActionButtons() por un botón único
  Widget _buildResultActionButtons() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {
          // Aquí podemos registrar que el usuario vio los resultados
          // y luego guardarlos automáticamente
          
          // Guardar los resultados en el backend
          _saveReceiptToServer();
          
          // Volver a la pantalla inicial
          setState(() {
            _uploadComplete = false;
            _imageFile = null;
          });
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
        icon: const Icon(Icons.arrow_back, size: 20),
        label: const Text(
          'Volver',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  // Agregar método para guardar el recibo en el servidor
  Future<void> _saveReceiptToServer() async {
    try {
      // Simulamos una llamada a la API para guardar el recibo
      await Future.delayed(const Duration(milliseconds: 300));
      
      // Aquí se enviarían los datos del recibo al backend
      // El recibo ya habría sido analizado durante el procesamiento inicial
      
      // Podríamos mostrar un pequeño mensaje de confirmación
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Recibo guardado correctamente'),
          duration: Duration(seconds: 2),
          backgroundColor: Color(0xFF1C6734),
        ),
      );
    } catch (error) {
      // Manejar error al guardar
      debugPrint('Error al guardar recibo: $error');
    }
  }
}