import 'package:flutter/material.dart';
import 'package:hangar_gym/pages/widgets/homepage/trending_program_container.dart';

class TrendingList extends StatelessWidget {
  final List<Map<String, dynamic>> classesData;

  const TrendingList({super.key, required this.classesData});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List<Widget>.generate(
          classesData.length,
          (index) {
            final eventName = classesData[index]["classTitle"];
            final eventImage = classesData[index]["classImage"];
            return Row(
              children: [
                TrendingPrograms(
                  sportTitle: eventName,
                  classImage: eventImage,
                ),
                const SizedBox(width: 10),
              ],
            );
          },
        ),
      ),
    );
  }
}
