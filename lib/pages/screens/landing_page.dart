


import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hangar_gym/config/assets.config.dart';
import 'package:hangar_gym/config/colors.config.dart';
import 'package:hangar_gym/pages/screens/home_page.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    // Wait for 5 seconds and then navigate to the login page
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background/landing.png'),
                  fit: BoxFit.cover,
                  opacity: 0.5,
                ),
                gradient: LinearGradient(
                  colors: [AppColors.mainBlue, AppColors.mainRed],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
          ),
          // Logo at the top
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 300,),
              Center(
                child: Image.asset(Assets.images.whiteLogo),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(140,0,0,0),
                child: Image.asset(Assets.images.gymwriting),
              ),
              SizedBox(height: 250,),
              Image.asset(Assets.images.bottomwriting),
            ],
          ),
        ],
      ),
    );
  }
}
