import 'package:flutter/material.dart';
import 'package:hangar_gym/config/assets.config.dart';
import 'package:hangar_gym/config/colors.config.dart';

class Discounts extends StatelessWidget {
  final Color color1;
  final Color color2;
  final String text;
  const Discounts({
    super.key,
    required this.color1,
    required this.color2,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
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
          Column(
            children: [
              Image.asset(Assets.images.discountTag),
              Image.asset(Assets.images.waterBottle),
            ],
          ),
          SizedBox(
            width: 150,
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 24,
                color: AppColors.white,
                fontFamily: 'Lato',
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Image.asset(Assets.images.announce),
        ],
      ),
    );
  }
}
