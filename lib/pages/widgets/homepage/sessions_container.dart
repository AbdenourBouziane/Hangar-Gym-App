import 'package:flutter/material.dart';
import 'package:hangar_gym/config/assets.config.dart';
import 'package:hangar_gym/config/colors.config.dart';
import 'package:hangar_gym/pages/widgets/homepage/sessions_slider.dart';

class SessionsContainer extends StatelessWidget {
  const SessionsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.white, AppColors.gradientPurple],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sessions",
                      style: TextStyle(
                          fontSize: 24,
                          color: AppColors.mainBlue,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "4 completed",
                    )
                  ],
                ),
                Image.asset(Assets.images.dumble),
              ],
            ),
            StaticSlider(
              value: 2, // Set your initial value
              divisions: 6, // Set the number of divisions or steps
              onChanged: (value) {},
              activeColor: AppColors.white,
              inactiveColor: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
