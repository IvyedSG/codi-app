import 'package:flutter/material.dart';

class LastReceiptCard extends StatelessWidget {
  const LastReceiptCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: const Color(0xFF9AE1B7), // Color #9AE1B7 completo para la tarjeta principal
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30), // Bordes más redondeados
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 24.0, vertical: 20.0), // Padding vertical reducido
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Centrado para mejor alineación
              children: [
                // Título y subtítulo
                Expanded(
                  flex: 4, // Más espacio para el texto
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Última Factura',
                        style: TextStyle(
                          fontSize: 22, // Tamaño adecuado
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4), // Menos espacio
                      Text(
                        'Supermercado Tottus',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),

                // Logo de Tottus
                Expanded(
                  flex: 3, // Menos espacio para el logo
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      'assets/images/tottus_logo.png',
                      width: 70, // Logo un poco más pequeño
                      height: 70,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24), // Espacio reducido entre secciones
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Valor de CO2 grande
                const Text(
                  '10,5 Kg',
                  style: TextStyle(
                    fontSize: 40, // Un poco más pequeño
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                // Ver detalles button
                SizedBox(
                  width: 130, // Botón ligeramente más estrecho
                  height: 42, // Altura reducida
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      elevation: 0, // Sin sombra
                      padding: EdgeInsets.zero,
                    ),
                    child: const Center(
                      child: Text(
                        'Ver detalles',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
