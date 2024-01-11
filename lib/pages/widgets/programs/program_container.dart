import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hangar_gym/config/assets.config.dart';
import 'package:hangar_gym/controllers/program_page_controller.dart';

class ProgramContainer extends StatelessWidget {
  final ProgramPageController controller = Get.put(ProgramPageController());

  ProgramContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.onSeeMoreClicked();
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          height: 180,
          child: Stack(
            fit: StackFit.expand,
            children: [
              ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5),
                  BlendMode.srcOver,
                ),
                child: Image.asset(
                  Assets.images.classgym,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.transparent,
                      Color.fromARGB(150, 12, 12, 12),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Wide Grip Barbell Curl',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lato',
                            ),
                          ),
                          const SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              controller.onSeeMoreClicked();
                            },
                            child: const Text(
                              'See more',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                fontFamily: 'Lato',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
