import 'package:flutter/material.dart';

class StandardItemWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  
  const StandardItemWidget({
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
          size: 16,
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