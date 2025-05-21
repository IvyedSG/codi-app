import 'package:flutter/material.dart';


class AnimatedPageTransition extends StatelessWidget {
  final Widget child;
  final bool animateEntrance;
  final TransitionType transitionType;
  final Duration duration;
  final Curve curve;

  const AnimatedPageTransition({
    super.key,
    required this.child,
    this.animateEntrance = true,
    this.transitionType = TransitionType.fadeSlideUp,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeOutQuint,
  });

  @override
  Widget build(BuildContext context) {
    // Si no queremos animar, devolvemos el child directamente
    if (!animateEntrance) {
      return child;
    }

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: duration,
      curve: curve,
      builder: (context, value, _) {
        switch (transitionType) {
          case TransitionType.fadeSlideUp:
            return Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(0, 20 * (1 - value)),
                child: child,
              ),
            );
          case TransitionType.fadeSlideLeft:
            return Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(20 * (1 - value), 0),
                child: child,
              ),
            );
          case TransitionType.fadeSlideRight:
            return Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(-20 * (1 - value), 0),
                child: child,
              ),
            );
          case TransitionType.fadeScale:
            return Opacity(
              opacity: value,
              child: Transform.scale(
                scale: 0.95 + (0.05 * value),
                child: child,
              ),
            );
          case TransitionType.justFade:
            return Opacity(
              opacity: value,
              child: child,
            );
        }
      },
    );
  }
}

enum TransitionType {
  fadeSlideUp,
  fadeSlideLeft,
  fadeSlideRight,
  fadeScale,
  justFade,
}