import 'package:flutter/material.dart';
import 'routes/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/app_constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppConstants.appName,
      theme: AppTheme.lightTheme.copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: NoAnimationTransitionsBuilder(),
            TargetPlatform.iOS: NoAnimationTransitionsBuilder(),
            TargetPlatform.linux: NoAnimationTransitionsBuilder(),
            TargetPlatform.macOS: NoAnimationTransitionsBuilder(),
            TargetPlatform.windows: NoAnimationTransitionsBuilder(),
          },
        ),
      ),
      darkTheme: AppTheme.darkTheme.copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: NoAnimationTransitionsBuilder(),
            TargetPlatform.iOS: NoAnimationTransitionsBuilder(),
            TargetPlatform.linux: NoAnimationTransitionsBuilder(),
            TargetPlatform.macOS: NoAnimationTransitionsBuilder(),
            TargetPlatform.windows: NoAnimationTransitionsBuilder(),
          },
        ),
      ),
      themeMode: ThemeMode.system,
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}

// Clase para desactivar animaciones de transición
class NoAnimationTransitionsBuilder extends PageTransitionsBuilder {
  const NoAnimationTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child; // Retorna el widget sin ninguna animación
  }
}
