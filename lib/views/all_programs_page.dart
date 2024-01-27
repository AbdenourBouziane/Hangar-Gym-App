import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hangar_gym/config/colors.config.dart';
import 'package:hangar_gym/controllers/program_page_controller.dart';
import 'package:hangar_gym/pages/widgets/background/background_screen.dart';
import 'package:hangar_gym/pages/widgets/programs/program_container.dart';

class AllPrograms extends StatelessWidget {
  final ProgramPageController controller = Get.find();

  AllPrograms({super.key});

  @override
  Widget build(BuildContext context) {
    return GradienBackground(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              const Text(
                "Our Programs",
                style: TextStyle(
                  fontSize: 26,
                  color: AppColors.white,
                  fontFamily: 'Lato',
                ),
              ),
              const SizedBox(height: 20),
              ProgramContainer(),
              const SizedBox(height: 20),
              ProgramContainer(),
              const SizedBox(height: 20),
              ProgramContainer(),
              const SizedBox(height: 20),
              ProgramContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
