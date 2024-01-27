import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hangar_gym/controllers/program_page_controller.dart';
import 'package:hangar_gym/pages/widgets/background/background_screen.dart';
import 'package:hangar_gym/pages/widgets/classes/full_classes.dart';

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
              const SizedBox(height: 20),
              FullClasses(),
            ],
          ),
        ),
      ),
    );
  }
}
