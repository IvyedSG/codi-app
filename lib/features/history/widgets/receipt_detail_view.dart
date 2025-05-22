import 'package:flutter/material.dart';
import '../../upload/models/receipt_model.dart';
import '../../upload/utils/receipt_formatter.dart';
import '../../upload/widgets/recommendation_widget.dart';

class ReceiptDetailView extends StatefulWidget {
  final Receipt receipt;
  final Map<String, String>? storeLogos;

  const ReceiptDetailView({
    Key? key,
    required this.receipt,
    this.storeLogos,
  }) : super(key: key);

  @override
  State<ReceiptDetailView> createState() => _ReceiptDetailViewState();
}

class _ReceiptDetailViewState extends State<ReceiptDetailView> {
  bool _showRecommendations = false;

  @override
  Widget build(BuildContext context) {
    // Obtener logo de la tienda si está disponible
    final String? logoPath = widget.storeLogos != null
        ? widget.storeLogos![widget.receipt.storeName]
        : null;

    return Scaffold(
      backgroundColor: const Color(0xFFEEF6F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFEEF6F6),
        elevation: 0,
        title: const Text(
          'Detalles del Recibo',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Vista previa de la imagen
            if (widget.receipt.receiptImagePath.isNotEmpty)
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
                  child: Image.asset(
                    widget.receipt.receiptImagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[200],
                        child: const Icon(
                          Icons.image_not_supported_outlined,
                          size: 50,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),
              ),

            const SizedBox(height: 20),

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
                    // Encabezado del recibo con logo si está disponible
                    Center(
                      child: Column(
                        children: [
                          // Logo de la tienda (si está disponible)
                          if (logoPath != null)
                            Container(
                              width: 60,
                              height: 60,
                              margin: const EdgeInsets.only(bottom: 12),
                              child: Image.asset(
                                logoPath,
                                fit: BoxFit.contain,
                              ),
                            ),

                          Text(
                            widget.receipt.storeName.toUpperCase(),
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
                            'Fecha: ${widget.receipt.date}    Hora: 15:30',
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
                    const Center(
                      child: Text(
                        '-------------------------------------',
                        style: TextStyle(fontSize: 14, letterSpacing: -0.5, height: 0.5),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Encabezados de la tabla de productos
                    const Row(
                      children: [
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
                    _buildSampleProductsList(),

                    const SizedBox(height: 16),
                    // Línea divisoria
                    const Center(
                      child: Text(
                        '-------------------------------------',
                        style: TextStyle(fontSize: 14, letterSpacing: -0.5, height: 0.5),
                      ),
                    ),
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
                          'S/ ${(widget.receipt.total * 0.82).toStringAsFixed(2)}',
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
                          'S/ ${(widget.receipt.total * 0.18).toStringAsFixed(2)}',
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
                          'S/ ${widget.receipt.total.toStringAsFixed(2)}',
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
                          '${widget.receipt.co2.toStringAsFixed(1)} Kg',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: widget.receipt.impactLevel == 'verde'
                                ? const Color(0xFF1C6734)
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),
                    // Línea divisoria
                    const Center(
                      child: Text(
                        '-------------------------------------',
                        style: TextStyle(fontSize: 14, letterSpacing: -0.5, height: 0.5),
                      ),
                    ),
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
                          '${widget.receipt.ecoProductCount}/7',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: widget.receipt.impactLevel == 'verde'
                                ? const Color(0xFF1C6734)
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Etiqueta de impacto ambiental mejorada
                    _buildImpactTag(),

                    const SizedBox(height: 16),

                    // Botón de ver recomendaciones con color mejorado
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            _showRecommendations = !_showRecommendations;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: widget.receipt.getImpactColor(),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0,
                        ),
                        icon: Icon(
                          _showRecommendations
                              ? Icons.visibility_off_outlined
                              : Icons.eco_outlined,
                          size: 18,
                        ),
                        label: Text(
                          _showRecommendations
                              ? 'Ocultar recomendaciones'
                              : 'Ver recomendaciones eco',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),

                    // Sección de recomendaciones (visible solo cuando se hace clic)
                    if (_showRecommendations) const RecommendationsList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImpactTag() {
    Color backgroundColor;
    String tagText;
    IconData tagIcon;
    Color textColor = widget.receipt.getImpactColor();

    switch (widget.receipt.impactLevel) {
      case 'verde':
        backgroundColor = textColor.withOpacity(0.2);
        tagText = 'Recibo Verde / Ejemplar';
        tagIcon = Icons.eco_outlined;
        break;
      case 'regular':
        backgroundColor = textColor.withOpacity(0.2);
        tagText = 'Regular / Puedes mejorar';
        tagIcon = Icons.warning_amber_outlined;
        break;
      case 'alto':
        backgroundColor = textColor.withOpacity(0.2);
        tagText = 'Alto impacto / Crítico';
        tagIcon = Icons.dangerous_outlined;
        break;
      default:
        backgroundColor = Colors.grey.withOpacity(0.2);
        tagText = 'No evaluado';
        tagIcon = Icons.help_outline;
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            tagIcon,
            color: textColor,
            size: 18,
          ),
          const SizedBox(width: 8),
          Text(
            tagText,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSampleProductsList() {
    // Datos de muestra para productos
    return Column(
      children: [
        ReceiptFormatter.buildReceiptItem('MANZANA NACIONAL', 0.750, 7.90, 0.3, true),
        ReceiptFormatter.buildReceiptItem('PLATANO ORGANICO', 1.000, 5.50, 0.2, true),
        ReceiptFormatter.buildReceiptItem('LECHE DESLAC X 1L', 2, 5.90, 1.8),
        ReceiptFormatter.buildReceiptItem('PAN INTEGRAL', 1, 8.90, 0.5, true),
        ReceiptFormatter.buildReceiptItem('HAMBURGUESA CARNE', 1, 15.90, 2.1),
        ReceiptFormatter.buildReceiptItem('PAPEL TOALLA ECO', 1, 12.50, 0.6, true),
        ReceiptFormatter.buildReceiptItem('DETERGENTE REGULAR', 1, 18.90, 1.1),
      ],
    );
  }
}