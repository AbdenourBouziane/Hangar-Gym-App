import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hangar_gym/config/colors.config.dart';
import 'package:hangar_gym/controllers/program_page_controller.dart';

class CustomEventContainer extends StatelessWidget {
  final String eventName;
  final String eventImage;
  final int eventId;
  final String eventDate;

  final ProgramPageController controller = Get.put(ProgramPageController());

  CustomEventContainer({
    required this.eventName,
    required this.eventImage,
    required this.eventId,
    required this.eventDate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Center(
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Container(
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: NetworkImage(eventImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.black.withOpacity(0.6),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        eventName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Lato',
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        eventDate,
                        style: const TextStyle(
                          color: AppColors.mainGrey,
                          fontSize: 16,
                          fontFamily: 'Lato',
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      controller.onDetailsClick(eventId);
                    },
                    child: const Text(
                      "See More",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Lato',
                        color: AppColors.mainGrey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
