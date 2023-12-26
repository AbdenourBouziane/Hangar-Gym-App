import 'package:flutter/material.dart';
import 'package:hangar_gym/config/colors.config.dart';
import 'package:shimmer/shimmer.dart';

class ClassShimmer extends StatelessWidget {
  const ClassShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.blueSecondary,
      highlightColor: Colors.black12,
      child: Container(
        height: 167,
        width: 212,
        decoration: BoxDecoration(
          color: AppColors.blueSecondary,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
