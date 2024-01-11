import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hangar_gym/config/assets.config.dart';
import 'package:hangar_gym/config/colors.config.dart';
import 'package:hangar_gym/controllers/program_page_controller.dart';
import 'package:hangar_gym/data/exercise_info.dart';
import 'package:hangar_gym/pages/widgets/background/background_screen.dart';
import 'package:hangar_gym/pages/widgets/specificPrograms/exercise_list.dart';

class SpecificProgram extends StatelessWidget {
  final ProgramPageController controller = Get.find();

  SpecificProgram({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return GradienBackground(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 350,
                width: screenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          Assets.images.classgymBig,
                          fit: BoxFit.cover,
                          width: screenWidth,
                          height: 350,
                        ),
                        Positioned(
                          top: 240,
                          left: 0,
                          right: 0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    AppColors.mainBlue,
                                    AppColors.mainRed,
                                  ],
                                ),
                              ),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Wide Grip Barbell curl',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Lato',
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(
                                        Icons.access_time,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                      Text(
                                        'Time',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'Lato',
                                        ),
                                      ),
                                      Icon(
                                        Icons.show_chart,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                      Text(
                                        'Intermediate',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'Lato',
                                        ),
                                      ),
                                      SizedBox(width: 16),
                                      FaIcon(
                                        FontAwesomeIcons.dumbbell,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        'Dumbbell Grell',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'Lato',
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ExercisesList(
                exercises: exercises,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
