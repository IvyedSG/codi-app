import 'package:flutter/material.dart';

// Enum para las posiciones de las esquinas
enum CornerPosition { topLeft, topRight, bottomLeft, bottomRight }

class CornerPainter extends CustomPainter {
  final CornerPosition position;
  
  const CornerPainter({required this.position});
  
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF9AE1B7)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    
    const length = 10.0;
    
    switch (position) {
      case CornerPosition.topLeft:
        canvas.drawLine(const Offset(0, 0), const Offset(length, 0), paint);
        canvas.drawLine(const Offset(0, 0), const Offset(0, length), paint);
        break;
      case CornerPosition.topRight:
        canvas.drawLine(Offset(size.width - length, 0), Offset(size.width, 0), paint);
        canvas.drawLine(Offset(size.width, 0), Offset(size.width, length), paint);
        break;
      case CornerPosition.bottomLeft:
        canvas.drawLine(Offset(0, size.height), Offset(length, size.height), paint);
        canvas.drawLine(Offset(0, size.height - length), Offset(0, size.height), paint);
        break;
      case CornerPosition.bottomRight:
        canvas.drawLine(Offset(size.width - length, size.height), Offset(size.width, size.height), paint);
        canvas.drawLine(Offset(size.width, size.height - length), Offset(size.width, size.height), paint);
        break;
    }
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class CornerWidget extends StatelessWidget {
  final CornerPosition position;
  
  const CornerWidget({Key? key, required this.position}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 24,
      child: CustomPaint(
        painter: CornerPainter(position: position),
      ),
    );
  }
}