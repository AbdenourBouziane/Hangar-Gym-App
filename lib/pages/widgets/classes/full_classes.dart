import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hangar_gym/backend/classes/db_classes.dart';
import 'package:hangar_gym/config/colors.config.dart';
import 'package:hangar_gym/controllers/program_page_controller.dart';
import 'package:hangar_gym/pages/widgets/classes/class_container.dart';
import 'package:hangar_gym/pages/widgets/classes/class_shimmer.widget.dart';

class FullClasses extends StatelessWidget {
  final ProgramPageController programPageController = Get.find();

  FullClasses({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: DbClasses().getClassesFromApi(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SingleChildScrollView(
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
                  ),
                  SizedBox(height: 30),
                  SingleChildScrollView(
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
                  ),
                  SizedBox(height: 30),
                  SingleChildScrollView(
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
                  ),
                ],
              ),
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

          List<String> days = classesData
              .map((classData) => classData['classDay'] as String)
              .toSet()
              .toList();

          days = sortDays(days);

          Map<String, List<Map<String, dynamic>>> groupedClasses =
              groupClassesByDay(classesData);

          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: List<Widget>.generate(
                days.length,
                (index) {
                  final day = days[index];
                  final classesForDay = groupedClasses[day]!;

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        day,
                        style: const TextStyle(
                          fontSize: 20,
                          color: AppColors.white,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List<Widget>.generate(
                            classesForDay.length,
                            (classIndex) {
                              final className =
                                  classesForDay[classIndex]["className"] ?? "";
                              final classImage =
                                  classesForDay[classIndex]["classImage"] ?? "";
                              final classLevel =
                                  classesForDay[classIndex]["classLevel"] ?? "";
                              final classTime =
                                  classesForDay[classIndex]["classTime"] ?? "";
                              final classDay =
                                  classesForDay[classIndex]["classDay"] ?? "";

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
                      ),
                      const SizedBox(height: 10),
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

  Map<String, List<Map<String, dynamic>>> groupClassesByDay(
      List<Map<String, dynamic>> classes) {
    Map<String, List<Map<String, dynamic>>> groupedClasses = {};

    for (var classData in classes) {
      final classDay = classData["classDay"] ?? "";
      if (!groupedClasses.containsKey(classDay)) {
        groupedClasses[classDay] = [];
      }
      groupedClasses[classDay]!.add(classData);
    }

    return groupedClasses;
  }

  List<String> sortDays(List<String> days) {
    List<String> customOrder = [
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
    ];

    days.sort((a, b) {
      int indexA = customOrder.indexOf(a);
      int indexB = customOrder.indexOf(b);

      if (indexA != -1 && indexB != -1) {
        return indexA.compareTo(indexB);
      } else {
        return indexA == -1 ? 1 : -1;
      }
    });

    return days;
  }
}
