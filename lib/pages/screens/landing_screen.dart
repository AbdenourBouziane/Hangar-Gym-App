import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hangar_gym/config/assets.config.dart';
import 'package:hangar_gym/config/colors.config.dart';
import 'package:hangar_gym/controllers/navigation_controller.dart';
import 'package:hangar_gym/pages/screens/home_page.dart';
import 'package:hangar_gym/pages/screens/registration/login_page.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _logoAnimation;
  late Animation<double> _textAnimation;
  late Animation<double> _bottomImageAnimation;
  late AnimationController _logoMoveController;
  late Animation<double> _logoMoveAnimation;
  late AnimationController _buttonsController;
  late Animation<double> _buttonsAnimation;

  bool _buttonsVisible = false;
  final NavigationController navigationController =
      Get.put(NavigationController());
  double logoTopPosition = 200;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _startLogoMoveAnimation();
      }
    });

    _logoAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.25),
      ),
    );

    _textAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.25),
      ),
    );

    _bottomImageAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1),
      ),
    );

    _logoMoveController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _logoMoveAnimation = Tween<double>(begin: 0, end: -250).animate(
      CurvedAnimation(
        parent: _logoMoveController,
        curve: Curves.easeInOut,
      ),
    );

    _buttonsController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _buttonsAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _buttonsController,
        curve: Curves.easeInOut,
      ),
    );

    Timer(const Duration(milliseconds: 500), () {
      _controller.forward();
    });
  }

  void _startLogoMoveAnimation() {
    _logoMoveController.forward().then((_) {
      // Add a delay before showing the buttons
      Timer(const Duration(milliseconds: 500), () {
        _buttonsController.forward();
        setState(() {
          _buttonsVisible = true;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/backgrounds/backgroundimage.png',
                  ),
                  fit: BoxFit.cover,
                  opacity: 0.5,
                ),
                gradient: LinearGradient(
                  colors: [AppColors.mainBlue, AppColors.mainRed],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 300),
                FadeTransition(
                  opacity: _logoAnimation,
                  child: AnimatedBuilder(
                    animation: _logoMoveAnimation,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, _logoMoveAnimation.value),
                        child: Image.asset(Assets.images.whiteLogo),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(140, 0, 0, 0),
                  child: FadeTransition(
                    opacity: _textAnimation,
                    child: AnimatedBuilder(
                      animation: _logoMoveAnimation,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(0, _logoMoveAnimation.value),
                          child: Image.asset(Assets.images.gymwriting),
                        );
                      },
                    ),
                  ),
                ),
                const Spacer(),
                FadeTransition(
                  opacity: _bottomImageAnimation,
                  child: Image.asset(Assets.images.bottomwriting),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                if (_buttonsVisible)
                  FadeTransition(
                    opacity: _buttonsAnimation,
                    child: ElevatedButton(
                      onPressed: () => _showDrawer(context, 'Login'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        minimumSize: const Size(300, 50),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            color: AppColors.mainRed,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                const SizedBox(height: 15),
                if (_buttonsVisible)
                  FadeTransition(
                    opacity: _buttonsAnimation,
                    child: ElevatedButton(
                      onPressed: () {
                        navigationController.navigateToHomePage();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.mainBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        minimumSize: const Size(300, 50),
                      ),
                      child: const Text(
                        'Guest',
                        style: TextStyle(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _logoMoveController.dispose();
    _buttonsController.dispose();
    super.dispose();
  }

  void _showDrawer(BuildContext context, String title) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return title == 'Login' ? const LoginPage() : HomePage();
      },
    );
  }
}
