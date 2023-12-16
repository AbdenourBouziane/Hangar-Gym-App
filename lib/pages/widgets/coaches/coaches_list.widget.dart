import 'package:flutter/material.dart';
import 'package:hangar_gym/backend/coaches/db_coaches.dart';
import 'package:hangar_gym/pages/widgets/coaches/coach_profile.widget.dart';
import 'package:hangar_gym/pages/widgets/coaches/coaches_shimmer.widget.dart';

class CoachesList extends StatelessWidget {
  const CoachesList({
    Key? key,
    required this.searchQuery,
  }) : super(key: key);

  final String searchQuery;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: DbCoaches().getCoachesApi(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SingleChildScrollView(
            child: Column(
              children: [
                CoachShimmerWidget(),
                SizedBox(height: 8),
                CoachShimmerWidget(),
                SizedBox(height: 8),
                CoachShimmerWidget(),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<Map<String, dynamic>> coachesData = snapshot.data!;

          if (coachesData.isEmpty) {
            DbCoaches().insertCoaches();
          }

          List<Map<String, dynamic>> displayedCoaches;

          if (searchQuery.isNotEmpty) {
            displayedCoaches = coachesData.where((coach) {
              final coachName = coach["coachName"].toLowerCase();
              return coachName.contains(searchQuery.toLowerCase());
            }).toList();
          } else {
            displayedCoaches = coachesData;
          }

          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: List<Widget>.generate(
                displayedCoaches.length,
                (index) {
                  final coachName = displayedCoaches[index]["coachName"];
                  final coachPicture = displayedCoaches[index]["coachImage"];
                  final coachProfession =
                      displayedCoaches[index]["coachProfession"];
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
      },
    );
  }
}
