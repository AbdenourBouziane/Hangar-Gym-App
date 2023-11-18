import 'package:flutter/material.dart';
import 'package:hangar_gym/config/colors.config.dart';
import 'package:hangar_gym/pages/widgets/background/background_screen.dart';
import 'package:hangar_gym/pages/widgets/programs/announcement_container.widget.dart';
import 'package:hangar_gym/pages/widgets/programs/plans_widget.dart';
import 'package:hangar_gym/views/appbar.dart';
import 'package:hangar_gym/views/bottombar.dart';

class ProgramPage extends StatelessWidget {
  const ProgramPage({super.key});

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
                      const Announcement(),
                      const SizedBox(height: 20),
                      const Text(
                        "Check our pricing plan",
                        style: TextStyle(
                          fontSize: 26,
                          color: AppColors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      PlansContainer(),
                      const SizedBox(height: 20),
                      const SizedBox(height: 20),
                      const Text(
                        "Trending Programs",
                        style: TextStyle(
                          fontSize: 26,
                          color: AppColors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
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
