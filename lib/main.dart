import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hangar_gym/pages/screens/home_page.dart';
import 'package:hangar_gym/pages/screens/landing_screen.dart';
import 'package:hangar_gym/routes/app_routes.dart';
import 'package:hangar_gym/utils/constant.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: 'https://qomnzrqnoczejhoctvit.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFvbW56cnFub2N6ZWpob2N0dml0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDI1NjEyODksImV4cCI6MjAxODEzNzI4OX0.uZzyT9Ole_fzRcu5MneyKqeSSy4LAFumFgr4km-GPMA');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const WhichPage(),
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes,
    );
  }
}

class WhichPage extends StatefulWidget {
  const WhichPage({super.key});

  @override
  State<WhichPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<WhichPage> {
  User? user;

  @override
  void initState() {
    getAuth();
    super.initState();
  }

  Future<void> getAuth() async {
    setState(() {
      user = client.auth.currentUser;
    });
    client.auth.onAuthStateChange.listen((event) {
      setState(() {
        user = event.session?.user;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return user == null ? LandingScreen() : HomePage();
  }
}
