import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../shared/widgets/app_bottom_nav_bar.dart';
import '../../../core/theme/app_theme.dart';
import 'package:go_router/go_router.dart';

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

  // Método para dibujar una esquina guía
  Widget _buildCorner(CornerPosition position) {
    return SizedBox(
      width: 24,
      height: 24,
      child: CustomPaint(
        painter: CornerPainter(position: position),
      ),
    );
  }

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
    await Future.delayed(const Duration(seconds: 1));
    
    setState(() {
      _imageFile = imageFile;
      _isLoading = false;
      _uploadComplete = true;
    });
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
      body: _uploadComplete ? _buildResultsScreen() : _buildScanScreen(),
      bottomNavigationBar: const AppBottomNavBar(currentIndex: 2),
    );
  }

  // Widget para pantalla de subida mejorado
  Widget _buildScanScreen() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título y texto explicativo
          const Text(
            '¿Qué es un Recibo Verde?',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1C6734),
            ),
          ),
          
          const SizedBox(height: 8),
          
          // Explicación más clara con iconos
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF9AE1B7).withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xFF1C6734).withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.eco_outlined,
                      size: 18,
                      color: Color(0xFF1C6734),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Estándares para Recibo Verde',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                _buildStandardItem(
                  'Más del 50% de productos eco-amigables',
                  Icons.check_circle_outline,
                ),
                const SizedBox(height: 8),
                _buildStandardItem(
                  'Presencia de bolsas reutilizables',
                  Icons.check_circle_outline,
                ),
                const SizedBox(height: 8),
                _buildStandardItem(
                  'Productos de temporada local',
                  Icons.check_circle_outline,
                ),
              ],
            ),
          ),
          
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
          
          // Vista previa de la cámara con mejor diseño
          Container(
            width: double.infinity,
            height: 320, // Altura reducida para dar más espacio a otros elementos
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
              child: _imageFile != null
                  ? Image.file(
                      _imageFile!,
                      fit: BoxFit.cover,
                    )
                  : Stack(
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
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF9AE1B7).withOpacity(0.2),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.camera_alt_outlined,
                                  size: 35,
                                  color: Color(0xFF1C6734),
                                ),
                              ),
                              
                              const SizedBox(height: 16),
                              
                              const Text(
                                'Alinea tu recibo',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              
                              const SizedBox(height: 8),
                              
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 40),
                                child: Text(
                                  'Posiciona la factura dentro del marco',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                ),
                              ),
                              
                              const SizedBox(height: 16),
                              
                              // Marco guía para la factura
                              Container(
                                width: 180,
                                height: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0xFF9AE1B7),
                                    width: 2,
                                    style: BorderStyle.solid,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    'Alinea aquí',
                                    style: TextStyle(
                                      fontSize: 12,
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
          
          const SizedBox(height: 24),
          
          // Botones de acción
          Row(
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
                  'Tips para mejorar la foto',
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
    
    // Variable para controlar si se muestran las recomendaciones
    bool _showRecommendations = false;

    return StatefulBuilder(
      builder: (context, setState) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título de resultados
              const Text(
                'Resultados de la Subida',
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
                  height: 120, // Altura reducida para dar más espacio al recibo
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
              Card(
                elevation: 0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Encabezado del recibo
                      Center(
                        child: Column(
                          children: [
                            Text(
                              store.toUpperCase(),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'AV. JAVIER PRADO ESTE 123, SAN BORJA',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'RUC: 20123456789',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'BOLETA DE VENTA ELECTRÓNICA',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'B007-00123456',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Fecha: $date    Hora: 15:30',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 16),
                      // Línea divisoria con estilo de recibo
                      const Center(child: Text('-------------------------------------', style: TextStyle(fontSize: 14, letterSpacing: -0.5, height: 0.5))),
                      const SizedBox(height: 16),
                      
                      // Encabezados de la tabla de productos
                      Row(
                        children: const [
                          Expanded(
                            flex: 5,
                            child: Text(
                              'DESCRIPCIÓN',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'CANT',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'PRECIO',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'CO₂',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 12),
                      
                      // Productos del recibo con su huella de carbono
                      _buildReceiptItem('MANZANA NACIONAL', 0.750, 7.90, 0.3, true),
                      _buildReceiptItem('PLATANO ORGANICO', 1.000, 5.50, 0.2, true),
                      _buildReceiptItem('LECHE DESLAC X 1L', 2, 5.90, 1.8),
                      _buildReceiptItem('PAN INTEGRAL', 1, 8.90, 0.5, true),
                      _buildReceiptItem('HAMBURGUESA CARNE', 1, 15.90, 2.1),
                      _buildReceiptItem('PAPEL TOALLA ECO', 1, 12.50, 0.6, true),
                      _buildReceiptItem('DETERGENTE REGULAR', 1, 18.90, 1.1),
                      
                      const SizedBox(height: 16),
                      // Línea divisoria
                      const Center(child: Text('-------------------------------------', style: TextStyle(fontSize: 14, letterSpacing: -0.5, height: 0.5))),
                      const SizedBox(height: 16),
                      
                      // Totales
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'SUBTOTAL:',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'S/ ${(double.parse(total) * 0.82).toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'IGV (18%):',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'S/ ${(double.parse(total) * 0.18).toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'TOTAL:',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'S/ $total',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'TOTAL CO₂:',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '$co2 Kg',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: isGreen ? const Color(0xFF1C6734) : Colors.black,
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 16),
                      // Línea divisoria
                      const Center(child: Text('-------------------------------------', style: TextStyle(fontSize: 14, letterSpacing: -0.5, height: 0.5))),
                      const SizedBox(height: 16),
                      
                      // Método de pago y últimos 4 dígitos
                      const Center(
                        child: Text(
                          'VISA ****3456',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Productos Eco-amigables: ',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            '$ecoProducts/7',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: isGreen ? const Color(0xFF1C6734) : Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      
                      // Etiqueta de recibo verde
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                        decoration: BoxDecoration(
                          color: isGreen
                              ? const Color(0xFF9AE1B7).withOpacity(0.2)
                              : Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              isGreen ? Icons.eco_outlined : Icons.receipt_outlined,
                              color: isGreen ? const Color(0xFF1C6734) : Colors.grey,
                              size: 18,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              isGreen ? 'Recibo Verde' : 'Recibo Regular',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: isGreen ? const Color(0xFF1C6734) : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Botón de ver recomendaciones
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              _showRecommendations = !_showRecommendations;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1C6734),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 0,
                          ),
                          icon: Icon(
                            _showRecommendations ? Icons.visibility_off_outlined : Icons.eco_outlined,
                            size: 18,
                          ),
                          label: Text(
                            _showRecommendations ? 'Ocultar recomendaciones' : 'Ver recomendaciones eco',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      
                      // Sección de recomendaciones (visible solo cuando se hace clic)
                      if (_showRecommendations)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            const Text(
                              'Alternativas de baja huella de carbono',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1C6734),
                              ),
                            ),
                            const SizedBox(height: 12),
                            
                            _buildRecommendationItem(
                              'Leche vegetal',
                              'Alternativa a Leche deslac',
                              '0.5 Kg de CO₂ (vs 1.8)',
                              Icons.trending_down,
                            ),
                            
                            const SizedBox(height: 10),
                            
                            _buildRecommendationItem(
                              'Hamburguesa vegetal',
                              'Alternativa a Hamburguesa de carne',
                              '0.4 Kg de CO₂ (vs 2.1)',
                              Icons.trending_down,
                            ),
                            
                            const SizedBox(height: 10),
                            
                            _buildRecommendationItem(
                              'Detergente ecológico',
                              'Alternativa a Detergente regular',
                              '0.3 Kg de CO₂ (vs 1.1)',
                              Icons.trending_down,
                            ),
                            
                            const SizedBox(height: 12),
                            
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: const Color(0xFF9AE1B7).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: const Color(0xFF1C6734).withOpacity(0.2),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Ahorro potencial de CO₂:',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    '3.2 Kg de CO₂ (53% menos)',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF1C6734),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Ingreso de datos adicionales
              Card(
                elevation: 0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Datos adicionales',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 12),
                      
                      // Form fields
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Notas para esta compra',
                          hintText: 'Ej: Compra semanal, productos para la oficina',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Botones de acción
              Row(
                children: [
                  // Botón para subir otro recibo
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        setState(() {
                          _uploadComplete = false;
                          _imageFile = null;
                        });
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: const BorderSide(color: Color(0xFF1C6734), width: 1.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      icon: const Icon(Icons.refresh),
                      label: const Text(
                        'Nueva Foto',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(width: 16),
                  
                  // Botón para guardar resultados
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Navegar a la pantalla de historial
                        context.go('/history');
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
                        Icons.check_circle_outline,
                        size: 20,
                      ),
                      label: const Text(
                        'Guardar',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
  
  // Widget para crear un elemento de recibo
  Widget _buildReceiptItem(String description, dynamic quantity, double price, double co2, [bool isEco = false]) {
    final total = quantity is int ? quantity * price : (quantity * price).toStringAsFixed(2);
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Descripción del producto
          Expanded(
            flex: 5,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isEco)
                  const Padding(
                    padding: EdgeInsets.only(right: 4),
                    child: Icon(
                      Icons.eco_outlined,
                      size: 12,
                      color: Color(0xFF1C6734),
                    ),
                  ),
                Expanded(
                  child: Text(
                    description,
                    style: TextStyle(
                      fontSize: 12,
                      color: isEco ? const Color(0xFF1C6734) : Colors.black,
                      fontWeight: isEco ? FontWeight.w500 : FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Cantidad
          Expanded(
            flex: 2,
            child: Text(
              quantity is int ? '$quantity' : quantity.toStringAsFixed(3),
              style: const TextStyle(
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // Precio unitario y total
          Expanded(
            flex: 2,
            child: Text(
              'S/ $total',
              style: const TextStyle(
                fontSize: 12,
              ),
              textAlign: TextAlign.right,
            ),
          ),
          const SizedBox(width: 8),
          // CO2
          Expanded(
            flex: 2,
            child: Text(
              '$co2 Kg',
              style: TextStyle(
                fontSize: 12,
                color: isEco ? const Color(0xFF1C6734) : co2 > 1.0 ? Colors.red.shade700 : Colors.black,
                fontWeight: co2 > 1.0 ? FontWeight.w500 : FontWeight.normal,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
  
  // Widget para crear un elemento de recomendación
  Widget _buildRecommendationItem(String title, String subtitle, String savings, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFF9AE1B7),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF9AE1B7).withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 20,
              color: const Color(0xFF1C6734),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1C6734),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            savings,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1C6734),
            ),
          ),
        ],
      ),
    );
  }

  // Widget para crear un elemento de tip
  Widget _buildTipItem(String text, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: const Color(0xFF1C6734),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  // Widget para crear un elemento de estándar
  Widget _buildStandardItem(String text, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: const Color(0xFF1C6734),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
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
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    
    const length = 10.0;
    
    switch (position) {
      case CornerPosition.topLeft:
        canvas.drawLine(const Offset(0, 0), const Offset(length, 0), paint);
        canvas.drawLine(const Offset(0, 0), const Offset(0, length), paint);
        break;
      case CornerPosition.topRight:
        canvas.drawLine(Offset(size.width - length, 0), Offset(size.width, 0), paint);
        canvas.drawLine(Offset(size.width, 0), Offset(size.width, length), paint);
        break;
      case CornerPosition.bottomLeft:
        canvas.drawLine(Offset(0, size.height), Offset(length, size.height), paint);
        canvas.drawLine(Offset(0, size.height - length), Offset(0, size.height), paint);
        break;
      case CornerPosition.bottomRight:
        canvas.drawLine(Offset(size.width - length, size.height), Offset(size.width, size.height), paint);
        canvas.drawLine(Offset(size.width, size.height - length), Offset(size.width, size.height), paint);
        break;
    }
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}