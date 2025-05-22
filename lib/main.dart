import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart'; // Para kReleaseMode
import 'routes/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/app_constants.dart';
import 'shared/widgets/app_bottom_nav_bar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Optimizaciones del sistema
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  
  // Establecer orientación preferida para mejor rendimiento
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  // Optimizaciones de memoria y rendimiento
  PaintingBinding.instance.imageCache.maximumSizeBytes = 1024 * 1024 * 100; // 100 MB para caché de imágenes
  
  // Optimizaciones de rendimiento más seguras y compatibles
  if (kReleaseMode) {
    // Métodos alternativos de optimización que son más compatibles
    // Las optimizaciones avanzadas como schedulerPhase no están disponibles
    // o han cambiado en esta versión de Flutter
  }
  
  runApp(const MyApp());
}

// Clase para transiciones instantáneas
class InstantPageTransitionsBuilder extends PageTransitionsBuilder {
  const InstantPageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    // Simplemente devolver el child sin animaciones
    return child;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppConstants.appName,
      theme: AppTheme.lightTheme.copyWith(
        scaffoldBackgroundColor: const Color(0xFFEEF6F6), 
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            // Usar transiciones instantáneas para todas las plataformas
            TargetPlatform.android: InstantPageTransitionsBuilder(),
            TargetPlatform.iOS: InstantPageTransitionsBuilder(),
            TargetPlatform.linux: InstantPageTransitionsBuilder(),
            TargetPlatform.macOS: InstantPageTransitionsBuilder(),
            TargetPlatform.windows: InstantPageTransitionsBuilder(),
          },
        ),
      ),
      darkTheme: AppTheme.darkTheme.copyWith(
        scaffoldBackgroundColor: const Color(0xFFEEF6F6),
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: InstantPageTransitionsBuilder(),
            TargetPlatform.iOS: InstantPageTransitionsBuilder(),
            TargetPlatform.linux: InstantPageTransitionsBuilder(),
            TargetPlatform.macOS: InstantPageTransitionsBuilder(),
            TargetPlatform.windows: InstantPageTransitionsBuilder(),
          },
        ),
      ),
      themeMode: ThemeMode.light,
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        // Optimizaciones globales
        return MediaQuery(
          // Evitar cambios de diseño cuando aparece el teclado
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
    );
  }
}