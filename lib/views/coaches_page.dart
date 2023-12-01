import 'package:flutter/material.dart';
import 'package:hangar_gym/data/coaches_info.dart';
import 'package:hangar_gym/pages/widgets/background/background_screen.dart';
import 'package:hangar_gym/pages/widgets/coaches/coaches_list.widget.dart';

class CoachesPage extends StatelessWidget {
  const CoachesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GradienBackground(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              CoachesList(
                coachesData: coachesData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
