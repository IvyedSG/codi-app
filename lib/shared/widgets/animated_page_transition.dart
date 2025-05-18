import 'package:flutter/material.dart';


class AnimatedPageTransition extends StatelessWidget {
  final Widget child;
  final bool animateEntrance;
  final TransitionType transitionType;
  final Duration? duration;
  final Curve? curve;

  const AnimatedPageTransition({
    super.key,
    required this.child,
    this.animateEntrance = false, // Cambiado a false por defecto
    this.transitionType = TransitionType.fadeSlideUp,
    this.duration,
    this.curve,
  });

  @override
  Widget build(BuildContext context) {
    // Siempre retorna el child directamente sin animación
    return child;
  }
}

// Mantener el enum por compatibilidad con código existente
enum TransitionType {
  fadeSlideUp,
  fadeSlideLeft,
  fadeSlideRight,
  fadeScale,
  justFade,
}