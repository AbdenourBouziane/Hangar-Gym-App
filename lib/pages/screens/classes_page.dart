import 'package:flutter/material.dart';
import 'package:hangar_gym/config/colors.config.dart';
import 'package:hangar_gym/config/assets.config.dart';

import 'package:hangar_gym/pages/widgets/background/background_screen.dart';
import 'package:hangar_gym/pages/widgets/programs/class_container.dart';
import 'package:hangar_gym/views/appbar.dart';
import 'package:hangar_gym/views/bottombar.dart';

class Classes extends StatelessWidget {
  const Classes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GradienBackground(
          child: CustomScrollView(
            slivers: <Widget>[
              const HeaderAppBar(),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
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
                      // Use a Row to display two ProgramContainer widgets in the same row
                      Row(
                        children: [
                          Expanded(
                            child: ClassContainer(backgroundImage: Assets.images.yogaClass),

                          ),
                          const SizedBox(width: 20), // Add spacing between containers
                          Expanded(
                            child: ClassContainer(backgroundImage: Assets.images.yogaClass),

                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: ClassContainer(backgroundImage: Assets.images.yogaClass),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: ClassContainer(backgroundImage: Assets.images.man),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: ClassContainer(backgroundImage: Assets.images.man),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: ClassContainer(backgroundImage: Assets.images.manTrain),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const NavigationBottomBar(),
    );
  }
}
