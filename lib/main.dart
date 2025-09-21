import 'package:flutter/material.dart';
import 'package:job_ghar/core/router/router_config.dart';

void main() {
  AppRouter.setUpRouter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
