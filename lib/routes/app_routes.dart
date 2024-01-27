import 'package:flutter/material.dart';
import 'package:hangar_gym/pages/screens/home/landing_screen.dart';
import 'package:hangar_gym/pages/screens/profile/edit_profile_page.dart';
import 'package:hangar_gym/pages/screens/home/home_page.dart';
import 'package:hangar_gym/pages/screens/profile/profile_page.dart';
import 'package:hangar_gym/pages/screens/home/qr_code_page.dart';
import 'package:hangar_gym/pages/screens/registration/login_page.dart';
import 'package:hangar_gym/pages/screens/registration/signup_page.dart';

class AppRoutes {
  static final routes = <String, WidgetBuilder>{
    '/editProfile': (context) => const EditProfilePage(),
    '/homePage': (context) => HomePage(),
    '/profile': (context) => const ProfilePage(),
    '/qrcode': (context) => QRcodePage(),
    '/loginPage': (context) => const LoginPage(),
    '/signupPage': (context) => const SignUpPage(),
    '/landingPage': (context) => LandingScreen(),
  };
}
