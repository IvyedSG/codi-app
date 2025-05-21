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
        ),
      ),
      GoRoute(
        path: '/history',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: _cachedHistoryScreen,
          transitionsBuilder: _buildTransition,
        ),
      ),
      GoRoute(
        path: '/upload',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: _cachedUploadScreen,
          transitionsBuilder: _buildTransition,
        ),
      ),
      GoRoute(
        path: '/profile',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: _cachedProfileScreen,
          transitionsBuilder: _buildTransition,
        ),
      ),
      GoRoute(
        path: '/promos',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: _cachedPromoScreen,
          transitionsBuilder: _buildTransition,
        ),
      ),
    ],
  );
  
  // Método compartido para transiciones entre pantallas
  static Widget _buildTransition(context, animation, secondaryAnimation, child) {
    const begin = Offset(0.0, 0.05);
    const end = Offset.zero;
    const curve = Curves.easeOutQuint;
    
    final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    final offsetAnimation = animation.drive(tween);
    
    return FadeTransition(
      opacity: animation.drive(CurveTween(curve: curve)),
      child: SlideTransition(
        position: offsetAnimation,
        child: child,
      ),
    );
  }
}
