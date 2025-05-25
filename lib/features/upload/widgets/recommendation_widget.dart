import 'package:flutter/material.dart';

class RecommendationItem extends StatelessWidget {
  final String title;
  final String savings;
  final IconData icon;
  final String store;
  final String price;
  final String imageAsset;

  const RecommendationItem({
    Key? key,
    required this.title,
    required this.savings,
    required this.icon,
    required this.store,
    required this.price,
    required this.imageAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFF9AE1B7),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: const Color(0xFF9AE1B7).withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 18,
                  color: const Color(0xFF1C6734),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1C6734),
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
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
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFEEF6F6),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      imageAsset,
                      width: 14,
                      height: 14,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      store,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "S/ $price",
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RecommendationsList extends StatelessWidget {
  const RecommendationsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
        
        RecommendationItem(
          title: 'Leche de almendras NaturGreen',
          savings: '0.5 Kg de CO₂ vs 1.8 Kg',
          icon: Icons.trending_down,
          store: 'Wong',
          price: '9.90',
          imageAsset: 'assets/images/wong_logo.png',
        ),
        
        const SizedBox(height: 10),
        
        RecommendationItem(
          title: 'Hamburguesa NotCo Plant Based',
          savings: '0.4 Kg de CO₂ vs 2.1 Kg',
          icon: Icons.trending_down,
          store: 'Plaza Vea',
          price: '17.90',
          imageAsset: 'assets/images/plazavea_logo.png',
        ),
        
        const SizedBox(height: 10),
        
        RecommendationItem(
          title: 'Detergente Ecológico Ecover',
          savings: '0.3 Kg de CO₂ vs 1.1 Kg',
          icon: Icons.trending_down,
          store: 'Tottus',
          price: '20.50',
          imageAsset: 'assets/images/tottus_logo.png',
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
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
    );
  }
}