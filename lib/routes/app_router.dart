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
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => _cachedHomeScreen,
      ),
      GoRoute(
        path: '/history',
        builder: (context, state) => _cachedHistoryScreen,
      ),
      GoRoute(
        path: '/upload',
        builder: (context, state) => _cachedUploadScreen,
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => _cachedProfileScreen,
      ),
      GoRoute(
        path: '/promos',
        builder: (context, state) => _cachedPromoScreen,
      ),
    ],
  );
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
