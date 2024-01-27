import 'package:flutter/material.dart';
import 'package:hangar_gym/config/assets.config.dart';
import 'package:hangar_gym/config/colors.config.dart';

class Discounts extends StatelessWidget {
  final Color color1;
  final Color color2;
  final String text;

  const Discounts({
    Key? key,
    required this.color1,
    required this.color2,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double textSize = screenWidth < 500 ? 18.0 : 22.0;
    bool showImages = screenWidth >= 200;

    return Container(
      height: 150,
      width: screenWidth,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [color1, color2],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (showImages)
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.images.discountTag,
                  ),
                  Image.asset(
                    Assets.images.waterBottle,
                  ),
                ],
              ),
            ),
          SizedBox(
            width: 150,
            child: Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: textSize,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                  fontFamily: 'Lato',
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          if (showImages)
            Expanded(
              child: Image.asset(
                Assets.images.announce,
              ),
            ),
        ],
      ),
    );
  }
}
