import 'package:flutter/material.dart';
import 'package:hangar_gym/config/assets.config.dart';
import 'package:hangar_gym/config/colors.config.dart';

class Discounts extends StatelessWidget {
  const Discounts({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.white, AppColors.blueGradient],
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
          const SizedBox(
            width: 150,
            child: Text(
              "10 % Discount on all products",
              style: TextStyle(
                fontSize: 24,
                color: AppColors.white,
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
