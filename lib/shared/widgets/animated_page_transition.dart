import 'package:flutter/material.dart';


class AnimatedPageTransition extends StatelessWidget {
  final Widget child;

  const AnimatedPageTransition({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    // Retornar el contenido sin animaciones
    return child;
  }
}