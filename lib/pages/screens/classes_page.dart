import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hangar_gym/config/colors.config.dart';
import 'package:hangar_gym/config/assets.config.dart';
import 'package:hangar_gym/controllers/program_page_controller.dart';
import 'package:hangar_gym/pages/widgets/background/background_screen.dart';
import 'package:hangar_gym/pages/widgets/classes/class_container.widget.dart';

class ClassesPage extends StatelessWidget {
  final ProgramPageController controller = Get.find();

  ClassesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GradienBackground(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              const Text(
                "Our Classes",
                style: TextStyle(
                  fontSize: 26,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ClassContainer(
                        backgroundImage: Assets.images.yogaClass),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child:
                        ClassContainer(backgroundImage: Assets.images.class1),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child:
                        ClassContainer(backgroundImage: Assets.images.class2),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child:
                        ClassContainer(backgroundImage: Assets.images.class3),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child:
                        ClassContainer(backgroundImage: Assets.images.class4),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child:
                        ClassContainer(backgroundImage: Assets.images.class2),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child:
                        ClassContainer(backgroundImage: Assets.images.class5),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child:
                        ClassContainer(backgroundImage: Assets.images.class6),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child:
                        ClassContainer(backgroundImage: Assets.images.class4),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child:
                        ClassContainer(backgroundImage: Assets.images.class1),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
