import 'package:flutter/material.dart';
import 'package:hangar_gym/config/assets.config.dart';
import 'package:hangar_gym/config/colors.config.dart';
import 'package:hangar_gym/data/events_info.dart';
import 'package:hangar_gym/pages/widgets/background_screen.dart';
import 'package:hangar_gym/pages/widgets/homepage/events_list.dart';
import 'package:hangar_gym/pages/widgets/homepage/sessions_container.dart';
import 'package:hangar_gym/pages/widgets/homepage/trending_program_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GradienBackground(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.menu,
                          color: AppColors.white,
                        ),
                      ),
                      Image.asset(
                        Assets.images.frameLogo,
                        height: 62,
                        width: 114,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.person,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
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
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        TrendingPrograms(),
                        SizedBox(width: 8),
                        TrendingPrograms(),
                        SizedBox(width: 8),
                        TrendingPrograms(),
                        SizedBox(width: 8),
                        TrendingPrograms(),
                        SizedBox(width: 8),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
