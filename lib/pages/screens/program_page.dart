import 'package:flutter/material.dart';
import 'package:hangar_gym/config/colors.config.dart';
import 'package:hangar_gym/pages/widgets/background/background_screen.dart';
import 'package:hangar_gym/pages/widgets/programs/announcement_container.widget.dart';
import 'package:hangar_gym/pages/widgets/programs/plans_widget.dart';

class ProgramPage extends StatelessWidget {
  const ProgramPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const GradienBackground(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Announcement(),
              SizedBox(height: 20),
              Text(
                "Check our pricing plan",
                style: TextStyle(
                  fontSize: 26,
                  color: AppColors.white,
                ),
              ),
              SizedBox(height: 20),
              PlansContainer(),
              SizedBox(height: 20),
              SizedBox(height: 20),
              Text(
                "Trending Programs",
                style: TextStyle(
                  fontSize: 26,
                  color: AppColors.white,
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
