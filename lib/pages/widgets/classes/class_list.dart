import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hangar_gym/backend/classes/db_classes.dart';
import 'package:hangar_gym/controllers/program_page_controller.dart';
import 'package:hangar_gym/pages/widgets/classes/class_container.dart';
import 'package:hangar_gym/pages/widgets/classes/class_shimmer.widget.dart';

class ClassLists extends StatelessWidget {
  final ProgramPageController programPageController = Get.find();

  ClassLists({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: DbClasses().getClassesFromApi(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ClassShimmer(),
                SizedBox(width: 10),
                ClassShimmer(),
                SizedBox(width: 10),
                ClassShimmer(),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error fetching classes: ${snapshot.error}',
              style: const TextStyle(color: Colors.red),
            ),
          );
        } else {
          List<Map<String, dynamic>> classesData = snapshot.data ?? [];

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List<Widget>.generate(
                classesData.length,
                (index) {
                  final className = classesData[index]["className"] ?? "";
                  final classImage = classesData[index]["classImage"] ?? "";
                  final classLevel = classesData[index]["classLevel"] ?? "";
                  final classTime = classesData[index]["classTime"] ?? "";
                  final classDay = classesData[index]["classDay"] ?? "";
                  return Row(
                    children: [
                      Class(
                        className: className,
                        classImage: classImage,
                        classLevel: classLevel,
                        classTime: classTime,
                        classDay: classDay,
                      ),
                      const SizedBox(width: 10),
                    ],
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}
