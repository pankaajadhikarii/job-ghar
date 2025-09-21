import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:job_ghar/view/auth/login_screen.dart';
import 'package:job_ghar/view/auth/signup_screen.dart';
import 'package:job_ghar/view/home/home_screen.dart';

class AppRouter {
  static late final GoRouter router;
  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();
  static void setUpRouter() {
    router = GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: '/login-screen',
      debugLogDiagnostics: true,
      redirect: (context, state) {
        final currentPath = state.uri.path;
        if (currentPath == '/') {
          return '/login-screen';
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
          path: '/home-screen',
          builder: (context, state) => const HomeScreen(),
        ),
      ],
    );
  }
}
