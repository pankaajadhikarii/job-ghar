import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:job_ghar/view/auth/login_screen.dart';
import 'package:job_ghar/view/auth/signup_screen.dart';
import 'package:job_ghar/view/dashboard/dashboard.dart';
import 'package:job_ghar/view/home/home_screen.dart';
import 'package:job_ghar/view_model/auth/auth_view_model.dart';

class AppRouter {
  static late final GoRouter router;
  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();
  static void setUpRouter(AuthProvider authProvider) {
    router = GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: '/login-screen',
      debugLogDiagnostics: true,
      refreshListenable: authProvider,
      redirect: (context, state) {
        final currentPath = state.uri.path;
        final isLoggedIn = authProvider.user != null;
        if (currentPath == '/') {
          return '/login-screen';
        }
        if (!isLoggedIn) {
          if (!['/login-screen', '/signup-screen'].contains(currentPath)) {
            return '/login-screen';
          }
        }
        return null;
      },
      routes: [
        GoRoute(
          path: '/login-screen',
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: '/signup-screen',
          builder: (context, state) => const SignupScreen(),
        ),
        GoRoute(
          path: '/dashboard',
          name: 'dashboard',
          builder: (context, state) => const Dashboard(),
          routes: [
            GoRoute(
              path: '/dashboard/home-screen',
              name: 'home-screen',
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
      ],
    );
  }
}
