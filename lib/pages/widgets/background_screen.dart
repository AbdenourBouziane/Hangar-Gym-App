import 'package:flutter/material.dart';
import 'package:hangar_gym/config/colors.config.dart';

class GradienBackground extends StatelessWidget {
  const GradienBackground({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [AppColors.mainBlue, AppColors.mainRed],
        ),
      ),
      child: child,
    );
  }
}
