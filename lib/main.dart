import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  
  runApp(const MyApp());
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
            TargetPlatform.android: SmoothPageTransitionsBuilder(),
            TargetPlatform.iOS: SmoothPageTransitionsBuilder(),
            TargetPlatform.linux: SmoothPageTransitionsBuilder(),
            TargetPlatform.macOS: SmoothPageTransitionsBuilder(),
            TargetPlatform.windows: SmoothPageTransitionsBuilder(),
          },
        ),
      ),
      darkTheme: AppTheme.darkTheme.copyWith(
        scaffoldBackgroundColor: const Color(0xFFEEF6F6),
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: SmoothPageTransitionsBuilder(),
            TargetPlatform.iOS: SmoothPageTransitionsBuilder(),
            TargetPlatform.linux: SmoothPageTransitionsBuilder(),
            TargetPlatform.macOS: SmoothPageTransitionsBuilder(),
            TargetPlatform.windows: SmoothPageTransitionsBuilder(),
          },
        ),
      ),
      themeMode: ThemeMode.light,
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}

// Clase para transiciones suaves optimizadas
class SmoothPageTransitionsBuilder extends PageTransitionsBuilder {
  const SmoothPageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    const begin = Offset(0.0, 0.05);
    const end = Offset.zero;
    const curve = Curves.easeOutQuint;
    
    // Solo anima las páginas que no son la primera en el stack
    final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    final offsetAnimation = animation.drive(tween);
    
    // Combinación de fade y slight slide para una experiencia premium
    return FadeTransition(
      opacity: animation.drive(CurveTween(curve: curve)),
      child: SlideTransition(
        position: offsetAnimation,
        child: child,
      ),
    );
  }
}