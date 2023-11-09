import 'package:flutter/material.dart';
import 'package:hangar_gym/config/colors.config.dart';
import 'package:hangar_gym/data/classes_info.dart';
import 'package:hangar_gym/data/events_info.dart';
import 'package:hangar_gym/pages/widgets/background_screen.dart';
import 'package:hangar_gym/pages/widgets/homepage/events_list.dart';
import 'package:hangar_gym/pages/widgets/homepage/sessions_container.dart';
import 'package:hangar_gym/pages/widgets/homepage/trending_list.dart';
import 'package:hangar_gym/views/appbar.dart';
import 'package:hangar_gym/views/bottombar.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

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
                      const SizedBox(height: 30),
                      const Text(
                        "Our Monthly Events",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 20),
                      EventList(
                        eventData: eventData,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Personal goal this week",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const SessionsContainer(),
                      const SizedBox(height: 20),
                      const Text(
                        "Trending Programs",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TrendingList(classesData: classesData),
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
