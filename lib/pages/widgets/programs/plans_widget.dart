import 'package:flutter/material.dart';
import 'package:hangar_gym/config/colors.config.dart';

class PlansContainer extends StatelessWidget {
  const PlansContainer({
    super.key,
    required this.subscriptiontitle,
    required this.timing,
    required this.monthly,
    required this.trimestriel,
    required this.semestriel,
    required this.annually,
  });

  final String subscriptiontitle;
  final String timing;
  final String monthly;
  final String trimestriel;
  final String semestriel;
  final String annually;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 270,
        decoration: const BoxDecoration(
          color: AppColors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
              child: Container(
                height: 90.0,
                width: 270,
                decoration: const BoxDecoration(
                  color: AppColors.mainBlue,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      subscriptiontitle,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        fontFamily: 'Lato',
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      timing,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontFamily: 'Lato',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 120.0,
              width: 270,
              decoration: const BoxDecoration(
                color: AppColors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildListItem(monthly, true),
                    buildListItem(trimestriel, true),
                    buildListItem(semestriel, true),
                    buildListItem(annually, true),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListItem(String text, bool isChecked) {
    return Row(
      children: [
        isChecked
            ? const Icon(
                Icons.check,
                color: Colors.green,
              )
            : const Icon(
                Icons.check_box_outline_blank,
                color: Colors.black,
              ),
        const SizedBox(width: 8.0),
        Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14.0,
            fontFamily: 'Lato',
          ),
        ),
      ],
    );
  }
}
