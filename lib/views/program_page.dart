import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hangar_gym/config/colors.config.dart';
import 'package:hangar_gym/controllers/program_page_controller.dart';
import 'package:hangar_gym/pages/widgets/background/background_screen.dart';
import 'package:hangar_gym/pages/widgets/programs/announcement_container.widget.dart';
import 'package:hangar_gym/pages/widgets/programs/plans_widget.dart';
import 'package:hangar_gym/pages/widgets/programs/program_container.dart';

class ProgramPage extends StatelessWidget {
  final ProgramPageController controller = Get.put(ProgramPageController());

  ProgramPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GradienBackground(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Announcement(),
              const SizedBox(height: 20),
              const Text(
                "Check our pricing plan",
                style: TextStyle(
                  fontSize: 26,
                  color: AppColors.white,
                  fontFamily: 'Lato',
                ),
              ),
              const SizedBox(height: 20),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(width: 20),
                    PlansContainer(),
                    SizedBox(width: 20),
                    PlansContainer(),
                    SizedBox(width: 20),
                    PlansContainer(),
                    SizedBox(width: 20),
                    PlansContainer(),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Trending Programs",
                    style: TextStyle(
                      fontSize: 26,
                      color: AppColors.white,
                      fontFamily: 'Lato',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.onSeeAllClicked();
                    },
                    child: const Text(
                      "See All",
                      style: TextStyle(
                        color: AppColors.mainGrey,
                        fontSize: 14,
                        fontFamily: 'Lato',
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              ProgramContainer(),
            ],
          ),
        ),
      ),
    );
  }
}