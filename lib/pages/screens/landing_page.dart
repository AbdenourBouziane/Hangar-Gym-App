import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hangar_gym/config/assets.config.dart';
import 'package:hangar_gym/config/colors.config.dart';
import 'package:hangar_gym/controllers/navigation_controller.dart';
import 'package:hangar_gym/pages/screens/home_page.dart';
import 'package:hangar_gym/pages/screens/registration/login_page.dart';
import 'package:hangar_gym/pages/widgets/background/background_screen.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final NavigationController navigationController =
      Get.put(NavigationController());
  double logoTopPosition = 200;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GradienBackground(
          child: Stack(
            children: [
              Positioned(
                top: logoTopPosition,
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    Assets.images.whiteLogo,
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => _showDrawer(context, 'Login'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        minimumSize: const Size(200, 50),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(color: AppColors.mainBlue),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        navigationController.navigateToHomePage();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.mainBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        minimumSize: const Size(200, 50),
                      ),
                      child: const Text(
                        'Guest',
                        style: TextStyle(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDrawer(BuildContext context, String title) {
    setState(() {
      logoTopPosition = 100;
    });

    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return title == 'Login' ? const LoginPage() : HomePage();
      },
    ).whenComplete(() {
      setState(() {
        logoTopPosition = 100;
      });
    });
  }
}
