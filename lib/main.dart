import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hangar_gym/pages/screens/landing_screen.dart';
import 'package:hangar_gym/routes/app_routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const LandingScreen(),
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes,
    );
  }
}
