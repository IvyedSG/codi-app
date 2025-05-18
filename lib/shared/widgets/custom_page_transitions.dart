import 'package:flutter/material.dart';


// Asegúrate de que estas clases de transición no se usen en el router
// Si es necesario, reemplázalas con versiones sin animación:

class FadeTransitionPage extends Page<void> {
  final Widget child;
  FadeTransitionPage({
    required this.child,
    String? name,
    Object? arguments,
    LocalKey? key,
  }) : super(key: key, name: name, arguments: arguments);

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) => child,
    );
  }
}
class SlideUpTransitionPage extends Page<void> {
  final Widget child;
  SlideUpTransitionPage({
    required this.child,
    String? name,
    Object? arguments,
    LocalKey? key,
  }) : super(key: key, name: name, arguments: arguments);

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) => child,
    );
  }
}
class SlideHorizontalTransitionPage extends Page<void> {
  final Widget child;
  final bool rightToLeft;
  SlideHorizontalTransitionPage({
    required this.child,
    required this.rightToLeft,
    String? name,
    Object? arguments,
    LocalKey? key,
  }) : super(key: key, name: name, arguments: arguments);

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) => child,
    );
  }
}   