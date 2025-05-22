import 'dart:io';
import 'package:flutter/material.dart';
import '../widgets/corner_painter.dart';

class CameraPreviewWidget extends StatelessWidget {
  final File? imageFile;
  
  const CameraPreviewWidget({Key? key, this.imageFile}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: imageFile != null
            ? Image.file(
                imageFile!,
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
                    child: CornerWidget(position: CornerPosition.topLeft),
                  ),
                  Positioned(
                    top: 40,
                    right: 40,
                    child: CornerWidget(position: CornerPosition.topRight),
                  ),
                  Positioned(
                    bottom: 40,
                    left: 40,
                    child: CornerWidget(position: CornerPosition.bottomLeft),
                  ),
                  Positioned(
                    bottom: 40,
                    right: 40,
                    child: CornerWidget(position: CornerPosition.bottomRight),
                  ),
                ],
              ),
      ),
    );
  }
}