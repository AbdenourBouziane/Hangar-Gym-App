import 'package:flutter/material.dart';
import 'package:hangar_gym/config/colors.config.dart';

class EventContainer extends StatelessWidget {
  const EventContainer(
      {super.key, required this.eventName, required this.eventImage});

  final String eventName;
  final String eventImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 119,
      width: 316,
      decoration: BoxDecoration(
        color: AppColors.blueSecondary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(eventImage),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                eventName,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Icon(
                    Icons.watch_later_outlined,
                    color: AppColors.white,
                    size: 14,
                  ),
                  SizedBox(width: 6),
                  Text(
                    "Each Friday",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppColors.mainBlue),
            ),
            child: const Text(
              "Details",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
