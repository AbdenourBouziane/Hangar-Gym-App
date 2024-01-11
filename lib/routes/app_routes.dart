import 'package:flutter/material.dart';
import 'package:hangar_gym/pages/screens/landing_screen.dart';
import 'package:hangar_gym/pages/screens/profile/edit_profile_page.dart';
import 'package:hangar_gym/pages/screens/home_page.dart';
import 'package:hangar_gym/pages/screens/profile/profile_page.dart';
import 'package:hangar_gym/pages/screens/qr_code_page.dart';
import 'package:hangar_gym/pages/screens/registration/login_page.dart';
import 'package:hangar_gym/pages/screens/registration/signup_page.dart';

class AppRoutes {
  static final routes = <String, WidgetBuilder>{
    '/editProfile': (context) => const EditProfilePage(),
    '/homePage': (context) => HomePage(),
    '/profile': (context) => const ProfilePage(),
    '/qrcode': (context) => const QRcodePage(),
    '/loginPage': (context) => LoginPage(),
    '/signupPage': (context) => SignUpPage(),
    '/landingPage': (context) => LandingScreen(),
  };
}
