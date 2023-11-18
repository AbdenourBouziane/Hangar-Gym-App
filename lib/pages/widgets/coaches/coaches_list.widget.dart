import 'package:flutter/material.dart';
import 'package:hangar_gym/pages/widgets/coaches/coach_profile.widget.dart';

class CoachesList extends StatelessWidget {
  final List<Map<String, dynamic>> coachesData;

  const CoachesList({Key? key, required this.coachesData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: List<Widget>.generate(
          coachesData.length,
          (index) {
            final coachName = coachesData[index]["coachName"];
            final coachPicture = coachesData[index]["coachImage"];
            final coachProfession = coachesData[index]["coachProfession"];
            return Column(
              children: [
                CoachProfile(
                  coacheName: coachName,
                  coachPicture: coachPicture,
                  coachProfession: coachProfession,
                ),
                const SizedBox(height: 20),
              ],
            );
          },
        ),
      ),
    );
  }
}
