import 'package:flutter/material.dart';
import 'package:hangar_gym/pages/screens/editProfile_page.dart';
import 'package:hangar_gym/pages/screens/home_page.dart';
import 'package:hangar_gym/pages/screens/program_page.dart';
import 'package:hangar_gym/pages/screens/editProfile_page.dart';
import 'pages/screens/allPrograms_page.dart';
 main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      routes: {
        '/home': (context) => HomePage(),
      },
      home: AllPrograms(),
      debugShowCheckedModeBanner: false,
    );
  }
}
