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
    this.transitionType = TransitionType.fadeScale, // Cambiado a fadeScale como default
    this.duration = const Duration(milliseconds: 200), // Consistente con las transiciones del router
    this.curve = Curves.easeOutCubic,
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
          case TransitionType.fade:
            return Opacity(
              opacity: value,
              child: child,
            );
          case TransitionType.fadeScale:
            return Opacity(
              opacity: value,
              child: Transform.scale(
                scale: 0.98 + (0.02 * value),
                child: child,
              ),
            );
          case TransitionType.horizontalSlide:
            return Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(20 * (1 - value), 0),
                child: child,
              ),
            );
          case TransitionType.horizontalSlideReverse:
            return Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(-20 * (1 - value), 0),
                child: child,
              ),
            );
          default:
            return child;
        }
      },
    );
  }
}

enum TransitionType {
  fade,
  fadeScale,
  horizontalSlide,
  horizontalSlideReverse,
}