import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hangar_gym/config/colors.config.dart';
import 'package:hangar_gym/controllers/program_page_controller.dart';

class Class extends StatelessWidget {
  final String className;
  final String classImage;
  final String classLevel;
  final String classTime;
  final String classDay;

  final ProgramPageController controller = Get.put(ProgramPageController());

  Class({
    super.key,
    required this.className,
    required this.classImage,
    required this.classLevel,
    required this.classTime,
    required this.classDay,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 167,
      decoration: BoxDecoration(
        color: AppColors.blueSecondary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            child: Container(
              width: 110,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(classImage),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 70,
                    child: Text(
                      className,
                      softWrap: true,
                      maxLines: 3,
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.white,
                        fontFamily: 'Lato',
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      const Icon(
                        Icons.bar_chart,
                        color: AppColors.white,
                        size: 12,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        classLevel,
                        style: const TextStyle(
                          color: AppColors.mainGrey,
                          fontSize: 12,
                          fontFamily: 'Lato',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(
                        Icons.timer_outlined,
                        color: AppColors.white,
                        size: 12,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        classTime,
                        style: const TextStyle(
                          color: AppColors.mainGrey,
                          fontSize: 12,
                          fontFamily: 'Lato',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
