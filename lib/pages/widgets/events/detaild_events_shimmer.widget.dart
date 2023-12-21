import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:hangar_gym/config/colors.config.dart';

class ShimmerEventDetailedContainer extends StatelessWidget {
  const ShimmerEventDetailedContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.blueSecondary,
      highlightColor: Colors.black12,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            width: 200,
            height: 50,
            color: Colors.white,
          ),
          const SizedBox(height: 20),
          Container(
            width: 500,
            height: 200,
            color: Colors.white,
          ),
          const SizedBox(height: 80),
          Container(
            width: 500,
            height: 200,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
