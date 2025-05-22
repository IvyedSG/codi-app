import 'package:flutter/material.dart';

class TipItemWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  
  const TipItemWidget({
    Key? key, 
    required this.text, 
    required this.icon
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: const Color(0xFF1C6734),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}