import 'package:flutter/material.dart';
import '../utils/receipt_formatter.dart';
import 'recommendation_widget.dart';

class ReceiptViewWidget extends StatefulWidget {
  final String store;
  final String date;
  final String total;
  final String co2;
  final String ecoProducts;
  final bool isGreen;

  const ReceiptViewWidget({
    Key? key,
    required this.store,
    required this.date,
    required this.total,
    required this.co2,
    required this.ecoProducts,
    required this.isGreen,
  }) : super(key: key);

  @override
  State<ReceiptViewWidget> createState() => _ReceiptViewWidgetState();
}

class _ReceiptViewWidgetState extends State<ReceiptViewWidget> {
  bool _showRecommendations = false;

  @override
  Widget build(BuildContext context) {
    return Card(
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
            buildReceiptHeader(),
            
            const SizedBox(height: 16),
            // Línea divisoria con estilo de recibo
            const Center(child: Text('-------------------------------------', style: TextStyle(fontSize: 14, letterSpacing: -0.5, height: 0.5))),
            const SizedBox(height: 16),
            
            // Encabezados de la tabla de productos
            buildTableHeader(),
            
            const SizedBox(height: 12),
            
            // Productos del recibo con su huella de carbono
            buildProductsList(),
            
            const SizedBox(height: 16),
            // Línea divisoria
            const Center(child: Text('-------------------------------------', style: TextStyle(fontSize: 14, letterSpacing: -0.5, height: 0.5))),
            const SizedBox(height: 16),
            
            // Totales
            buildTotalsSection(),
            
            const SizedBox(height: 16),
            // Línea divisoria
            const Center(child: Text('-------------------------------------', style: TextStyle(fontSize: 14, letterSpacing: -0.5, height: 0.5))),
            const SizedBox(height: 16),
            
            // Método de pago y productos eco
            buildPaymentAndEcoSection(),
            
            const SizedBox(height: 16),
            
            // Etiqueta de recibo verde
            buildGreenReceiptTag(),
            
            const SizedBox(height: 16),
            
            // Botón de ver recomendaciones
            buildRecommendationsButton(),
            
            // Sección de recomendaciones (visible solo cuando se hace clic)
            if (_showRecommendations)
              const RecommendationsList(),
          ],
        ),
      ),
    );
  }

  Widget buildReceiptHeader() {
    return Center(
      child: Column(
        children: [
          Text(
            widget.store.toUpperCase(),
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
            'Fecha: ${widget.date}    Hora: 15:30',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget buildTableHeader() {
    return const Row(
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
    );
  }

  Widget buildProductsList() {
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

  Widget buildTotalsSection() {
    final double totalValue = double.parse(widget.total);
    
    return Column(
      children: [
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
              'S/ ${(totalValue * 0.82).toStringAsFixed(2)}',
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
              'S/ ${(totalValue * 0.18).toStringAsFixed(2)}',
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
              'S/ ${widget.total}',
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
              '${widget.co2} Kg',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: widget.isGreen ? const Color(0xFF1C6734) : Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildPaymentAndEcoSection() {
    return Column(
      children: [
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
              '${widget.ecoProducts}/7',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: widget.isGreen ? const Color(0xFF1C6734) : Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildGreenReceiptTag() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: widget.isGreen
            ? const Color(0xFF9AE1B7).withOpacity(0.2)
            : Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            widget.isGreen ? Icons.eco_outlined : Icons.receipt_outlined,
            color: widget.isGreen ? const Color(0xFF1C6734) : Colors.grey,
            size: 18,
          ),
          const SizedBox(width: 8),
          Text(
            widget.isGreen ? 'Recibo Verde' : 'Recibo Regular',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: widget.isGreen ? const Color(0xFF1C6734) : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRecommendationsButton() {
    return SizedBox(
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
    );
  }
}