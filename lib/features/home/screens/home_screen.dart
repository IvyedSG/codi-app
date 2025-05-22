import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/animated_page_transition.dart';
import '../../../shared/widgets/app_bottom_nav_bar.dart';
import '../widgets/co2_card.dart';
import '../widgets/last_receipt_card.dart';
import '../widgets/offer_card.dart';
import '../widgets/green_receipts_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF6F6), // Color #EEF6F6
      appBar: AppBar(
        backgroundColor: const Color(0xFFEEF6F6), // Color #EEF6F6
        elevation: 0,
        title: const Text(
          'Inicio',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: false,
      ),
      body: AnimatedPageTransition(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Último recibo card (renombrado)
              const LastReceiptCard(title: 'Último Recibo'),

              const SizedBox(height: 20),

              // Dual card row (Recibos Verdes y CO2 acumulado)
              const Row(
                children: [
                  // Recibos Verdes Card
                  Expanded(
                    child: GreenReceiptsCard(),
                  ),
                  SizedBox(width: 10),
                  // CO2 Acumulado Card (sin objetivo)
                  Expanded(
                    child: CO2Card(showObjective: false),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Ofertas section
              const Text(
                'Ofertas',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 12),

              // Ofertas cards
              const OfferCard(
                icon: Icons.percent,
                title: 'Descuento en tienda - 10 %',
              ),

              const SizedBox(height: 10),

              const OfferCard(
                icon: Icons.shopping_bag_outlined,
                title: 'Bolsa reutilizable 200 g',
              ),

              const SizedBox(height: 20),

              // Botones de acción rápida
              Row(
                children: [
                  // Botón Escanear
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        context.go('/upload');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF9AE1B7),
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // Border radius reducido
                        ),
                        elevation: 0,
                      ),
                      icon: const Icon(Icons.camera_alt_rounded),
                      label: const Text(
                        'Escanear',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Botón Ver impacto
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        context.go('/profile');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // Border radius reducido
                        ),
                        elevation: 0,
                      ),
                      icon: const Icon(Icons.bar_chart_rounded),
                      label: const Text(
                        'Ver impacto',
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
        ),
      ),
      bottomNavigationBar: const AppBottomNavBar(currentIndex: 0),
    );
  }
}
