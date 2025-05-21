import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/auth/screens/login_screen.dart';
import '../features/auth/screens/register_screen.dart'; 
import '../features/home/screens/home_screen.dart';
import '../features/history/screens/history_screen.dart';
import '../features/upload/screens/upload_screen.dart';
import '../features/profile/screens/profile_screen.dart';
import '../features/promos/screens/promos_screen.dart';
import '../shared/widgets/app_bottom_nav_bar.dart';

class AppRouter {
  // Mantener referencias a pantallas pre-construidas para optimizar la memoria
  static final _homeScreen = GlobalKey<NavigatorState>();
  static final _historyScreen = GlobalKey<NavigatorState>();
  static final _uploadScreen = GlobalKey<NavigatorState>(); 
  static final _promoScreen = GlobalKey<NavigatorState>();
  static final _profileScreen = GlobalKey<NavigatorState>();
  
  // Caching de páginas instanciadas para mejorar rendimiento
  static final Widget _cachedHomeScreen = HomeScreen(key: _homeScreen);
  static final Widget _cachedHistoryScreen = HistoryScreen(key: _historyScreen);
  static final Widget _cachedUploadScreen = UploadScreen(key: _uploadScreen);
  static final Widget _cachedPromoScreen = PromosScreen(key: _promoScreen);
  static final Widget _cachedProfileScreen = ProfileScreen(key: _profileScreen);

  static final router = GoRouter(
    navigatorKey: AppBottomNavBar.navigatorKey,
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const LoginScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeOutQuint).animate(animation),
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 200),
        ),
      ),
      GoRoute(
        path: '/register',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const RegisterScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeOutQuint).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: '/home',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: _cachedHomeScreen,
          transitionsBuilder: _buildTransition,
          transitionDuration: const Duration(milliseconds: 200),
        ),
      ),
      GoRoute(
        path: '/history',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: _cachedHistoryScreen,
          transitionsBuilder: _buildTransition,
          transitionDuration: const Duration(milliseconds: 200),
        ),
      ),
      GoRoute(
        path: '/upload',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: _cachedUploadScreen,
          transitionsBuilder: _buildTransition,
          transitionDuration: const Duration(milliseconds: 200),
        ),
      ),
      GoRoute(
        path: '/profile',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: _cachedProfileScreen,
          transitionsBuilder: _buildTransition,
          transitionDuration: const Duration(milliseconds: 200),
        ),
      ),
      GoRoute(
        path: '/promos',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: _cachedPromoScreen,
          transitionsBuilder: _buildTransition,
          transitionDuration: const Duration(milliseconds: 200),
        ),
      ),
    ],
  );
  
  // Método compartido para transiciones entre pantallas
  static Widget _buildTransition(context, animation, secondaryAnimation, child) {
    const curve = Curves.easeOutCubic;
    
    // Transición suave de fade con un ligero efecto de escala
    return FadeTransition(
      opacity: animation.drive(CurveTween(curve: curve)),
      child: ScaleTransition(
        scale: Tween<double>(
          begin: 0.98, 
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: curve,
          ),
        ),
        child: child,
      ),
    );
  }
}

// Ejemplo para HomeScreen
@override
Widget build(BuildContext context) {
  return RepaintBoundary(
    child: Scaffold(
      // ...contenido existente
    ),
  );
}
