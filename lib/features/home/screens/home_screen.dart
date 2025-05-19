import 'package:flutter/material.dart';
import '../../../shared/widgets/animated_page_transition.dart';
import '../../../shared/widgets/app_bottom_nav_bar.dart';
import '../widgets/carbo_points_card.dart';
import '../widgets/co2_card.dart';
import '../widgets/last_receipt_card.dart';
import '../widgets/offer_card.dart';
import '../widgets/upload_receipt_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
              // Última factura card
              const LastReceiptCard(),

              const SizedBox(height: 20),

              // Dual card row (CarboPuntos y CO2 acumulado)
              const Row(
                children: [
                  // CarboPuntos Card
                  Expanded(
                    child: CarboPointsCard(),
                  ),
                  SizedBox(width: 10),
                  // CO2 Acumulado Card
                  Expanded(
                    child: CO2Card(),
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

              // Subir nueva factura button card
              const UploadReceiptCard(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const AppBottomNavBar(currentIndex: 0),
    );
  }
}
