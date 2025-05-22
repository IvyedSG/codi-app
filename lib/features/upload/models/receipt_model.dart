import 'package:flutter/material.dart';

class Receipt {
  final String id;
  final String storeName;
  final String date;
  final double total;
  final double co2;
  final String impactLevel; // "verde", "regular", "alto"
  final int ecoProductCount;
  final String receiptImagePath;
  final String scannedText;

  Receipt({
    required this.id,
    required this.storeName,
    required this.date,
    required this.total,
    required this.co2,
    required this.impactLevel,
    required this.ecoProductCount,
    required this.receiptImagePath,
    required this.scannedText,
  });

  // Método para convertir de JSON a objeto
  factory Receipt.fromJson(Map<String, dynamic> json) {
    return Receipt(
      id: json['id'],
      storeName: json['storeName'],
      date: json['date'],
      total: json['total'].toDouble(),
      co2: json['co2'].toDouble(),
      impactLevel: json['impactLevel'],
      ecoProductCount: json['ecoProductCount'],
      receiptImagePath: json['receiptImagePath'],
      scannedText: json['scannedText'],
    );
  }

  // Método para convertir de objeto a JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'storeName': storeName,
      'date': date,
      'total': total,
      'co2': co2,
      'impactLevel': impactLevel,
      'ecoProductCount': ecoProductCount,
      'receiptImagePath': receiptImagePath,
      'scannedText': scannedText,
    };
  }
  
  // Método para obtener color según nivel de impacto (colores mejorados)
  Color getImpactColor() {
    switch (impactLevel) {
      case 'verde':
        return const Color(0xFF2E7D32); // Verde más oscuro
      case 'regular':
        return const Color(0xFFF57C00); // Naranja más oscuro
      case 'alto':
        return const Color(0xFFD32F2F); // Rojo más oscuro
      default:
        return const Color(0xFF9E9E9E); // Gris por defecto
    }
  }
  
  // Método para obtener texto descriptivo del nivel de impacto
  String getImpactDescription() {
    switch (impactLevel) {
      case 'verde':
        return 'Recibo Verde / Ejemplar';
      case 'regular':
        return 'Regular / Puedes mejorar';
      case 'alto':
        return 'Alto impacto / Crítico';
      default:
        return 'No evaluado';
    }
  }
  
  // Método para obtener icono según nivel de impacto
  IconData getImpactIcon() {
    switch (impactLevel) {
      case 'verde':
        return Icons.eco_outlined;
      case 'regular':
        return Icons.warning_amber_outlined;
      case 'alto':
        return Icons.dangerous_outlined;
      default:
        return Icons.help_outline;
    }
  }
}