import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hangar_gym/config/colors.config.dart';

class InfoAccess extends StatelessWidget {
  const InfoAccess({
    Key? key,
    required this.text1,
    required this.text2,
    this.text3,
    required this.icon1,
    required this.icon2,
    this.icon3,
    required this.height,
  }) : super(key: key);

  final String text1;
  final String text2;
  final String? text3;

  final double height;

  final IconData icon1;
  final IconData icon2;
  final IconData? icon3;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                FaIcon(icon1),
                const SizedBox(width: 10),
                Text(
                  text1,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                FaIcon(icon2),
                const SizedBox(width: 10),
                Text(
                  text2,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            if (text3 != null && icon3 != null)
              Row(
                children: [
                  Icon(icon3),
                  const SizedBox(width: 10),
                  Text(
                    text3!,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
