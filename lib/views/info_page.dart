import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hangar_gym/config/colors.config.dart';
import 'package:hangar_gym/controllers/program_page_controller.dart';
import 'package:hangar_gym/data/classes_info.dart';
import 'package:hangar_gym/data/events_info.dart';
import 'package:hangar_gym/pages/widgets/background/background_screen.dart';
import 'package:hangar_gym/pages/widgets/homepage/events_list.dart';
import 'package:hangar_gym/pages/widgets/homepage/sessions_container.dart';
import 'package:hangar_gym/pages/widgets/homepage/trending_list.dart';
import 'package:hangar_gym/pages/widgets/store/discount.widget.dart';

class InfoPage extends StatelessWidget {
  final ProgramPageController controller = Get.put(ProgramPageController());
  InfoPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GradienBackground(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const Text(
                "Our Monthly Events",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontFamily: 'Lato',
                ),
              ),
              const SizedBox(height: 20),
              EventList(
                eventData: eventData,
              ),
              const SizedBox(height: 20),
              const Text(
                "Personal goal this week",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontFamily: 'Lato',
                ),
              ),
              const SizedBox(height: 20),
              const SessionsContainer(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Trending Programs",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontFamily: 'Lato',
                    ),
                  ),
                  Text(
                    "See More",
                    style: TextStyle(
                      color: AppColors.white.withOpacity(0.5),
                      fontSize: 12,
                      fontFamily: 'Lato',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TrendingList(
                classesData: classesData,
              ),
              const SizedBox(height: 20),
              const Discounts(
                text: "30 % Discount on all programs",
                color1: AppColors.white,
                color2: AppColors.mainRed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
