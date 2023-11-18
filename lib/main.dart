import 'package:flutter/material.dart';
import 'package:hangar_gym/pages/screens/program_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProgramPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
