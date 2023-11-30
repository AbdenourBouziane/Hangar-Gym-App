import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hangar_gym/config/colors.config.dart';
import 'package:hangar_gym/pages/screens/coaches_page.dart';
import 'package:hangar_gym/pages/screens/home_page.dart';
import 'package:hangar_gym/pages/screens/program_page.dart';
import 'package:hangar_gym/pages/screens/store_page.dart';

class NavigationBottomBar extends StatelessWidget {
  const NavigationBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.mainRed, AppColors.mainBlue],
        ),
      ),
      child: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StorePage()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.group),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CoachesPage()),
                );
              },
            ),
            IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.dumbbell,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProgramPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
