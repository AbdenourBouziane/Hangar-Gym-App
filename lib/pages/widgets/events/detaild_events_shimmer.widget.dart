import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:hangar_gym/config/colors.config.dart';

class ShimmerEventDetailedContainer extends StatelessWidget {
  const ShimmerEventDetailedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.blueSecondary,
      highlightColor: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 200,
                height: 50,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 500,
                height: 200,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 400,
                height: 50,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 500,
                height: 200,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
