import 'package:flutter/material.dart';

class RecommendationItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String savings;
  final IconData icon;

  const RecommendationItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.savings,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFF9AE1B7),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF9AE1B7).withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 20,
              color: const Color(0xFF1C6734),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1C6734),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
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
          title: 'Leche vegetal',
          subtitle: 'Alternativa a Leche deslac',
          savings: '0.5 Kg de CO₂ (vs 1.8)',
          icon: Icons.trending_down,
        ),
        
        const SizedBox(height: 10),
        
        RecommendationItem(
          title: 'Hamburguesa vegetal',
          subtitle: 'Alternativa a Hamburguesa de carne',
          savings: '0.4 Kg de CO₂ (vs 2.1)',
          icon: Icons.trending_down,
        ),
        
        const SizedBox(height: 10),
        
        RecommendationItem(
          title: 'Detergente ecológico',
          subtitle: 'Alternativa a Detergente regular',
          savings: '0.3 Kg de CO₂ (vs 1.1)',
          icon: Icons.trending_down,
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