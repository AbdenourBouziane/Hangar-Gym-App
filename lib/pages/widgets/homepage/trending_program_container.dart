import 'package:flutter/material.dart';
import 'package:hangar_gym/config/assets.config.dart';
import 'package:hangar_gym/config/colors.config.dart';
import 'package:hangar_gym/pages/widgets/homepage/sessions_slider.dart';

class TrendingPrograms extends StatelessWidget {
  const TrendingPrograms({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 149,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(Assets.images.yogaClass),
          fit: BoxFit.contain, // Set fit to BoxFit.fill
          alignment: Alignment.topCenter, // Align to the top
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            const Text(
              "Power yoga",
              style: TextStyle(
                fontSize: 16,
                color: AppColors.mainBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Classes",
              style: TextStyle(
                fontSize: 14,
                color: AppColors.mainBlue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Class Full",
              style: TextStyle(
                fontSize: 16,
                color: AppColors.mainBlue,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            StaticSlider(
              value: 40, // Set your initial value
              divisions: 100, // Set the number of divisions or steps
              onChanged: (value) {},
              activeColor: AppColors.mainBlue,
              inactiveColor: AppColors.mainGrey,
            ),
          ],
        ),
      ),
    );
  }
}
