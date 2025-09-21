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
      routes: [
        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: '/signup',
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
