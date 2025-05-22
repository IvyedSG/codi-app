import 'package:flutter/material.dart';

class ReceiptFormatter {
  static Widget buildReceiptItem(String description, dynamic quantity, double price, double co2, [bool isEco = false]) {
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
}