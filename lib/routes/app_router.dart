import 'package:go_router/go_router.dart';
import '../features/auth/screens/login_screen.dart';
import '../features/home/screens/home_screen.dart';
import '../features/scan/screens/scan_screen.dart';
import '../features/history/screens/history_screen.dart';
import '../features/profile/screens/profile_screen.dart';
import '../features/results/screens/results_screen.dart';

// Configurar GoRouter para que use transiciones instantáneas
final appRouter = GoRouter(
  initialLocation: '/login',
  // Esto desactiva las transiciones al navegar
  // y hace que el cambio sea inmediato
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/scan',
      builder: (context, state) => const ScanScreen(),
    ),
    GoRoute(
      path: '/results',
      builder: (context, state) => const ResultsScreen(),
    ),
    GoRoute(
      path: '/history',
      builder: (context, state) => const HistoryScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
  ],
);