import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hangar_gym/pages/screens/edit_profile_page.dart';
import 'package:hangar_gym/pages/screens/home_page.dart';
import 'package:hangar_gym/pages/screens/landing_screen.dart';
import 'package:hangar_gym/pages/screens/profile_page.dart';
import 'package:hangar_gym/pages/screens/qr_code_page.dart';

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
      routes: {
        '/editProfile': (context) => const EditProfilePage(),
        '/homePage': (context) => HomePage(),
        '/profile': (context) => const ProfilePage(),
        '/qrcode': (context) => const QRcodePage(),
      },
    );
  }
}
