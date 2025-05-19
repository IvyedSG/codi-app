import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';

class UploadReceiptCard extends StatelessWidget {
  const UploadReceiptCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtener el ancho de la pantalla
    final screenWidth = MediaQuery.of(context).size.width;

    return Card(
      elevation: 0,
      margin: EdgeInsets.zero, // Eliminar margen por defecto del Card
      color: AppTheme.primaryGreen
          .withOpacity(0.1), // Color más claro como en la imagen
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24), // Bordes más redondeados
      ),
      child: Container(
        width: screenWidth, // Usar todo el ancho disponible
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centrar verticalmente
          crossAxisAlignment:
              CrossAxisAlignment.center, // Centrar horizontalmente
          children: [
            const Text(
              'Subir nueva factura',
              style: TextStyle(
                fontSize: 18, // Texto más grande
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24), // Más espacio

            // Icono de cámara con fondo verde claro
            Container(
              width: 80, // Más grande
              height: 80, // Más grande
              decoration: BoxDecoration(
                color: AppTheme.primaryGreen.withOpacity(0.2),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(
                    16), // Bordes redondeados del contenedor
              ),
              child: const Center(
                child: Icon(
                  Icons.camera_alt_rounded, // Icono de cámara
                  color: Color(0xFF2E7D32), // Verde más oscuro
                  size: 40, // Más grande
                ),
              ),
            ),

            const SizedBox(height: 24), // Más espacio

            // Botón para tomar foto - Ahora es más ancho
            SizedBox(
              width: double.infinity, // Ocupar todo el ancho disponible
              height: 48, // Altura mayor
              child: ElevatedButton(
                onPressed: () {
                  context.go('/scan');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24), // Más redondeado
                  ),
                  elevation: 0, // Sin sombra
                ),
                child: const Text(
                  'Tomar foto',
                  style: TextStyle(
                    fontSize: 16, // Texto más grande
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
}
