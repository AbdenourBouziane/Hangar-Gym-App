import 'package:flutter/material.dart';
import 'package:hangar_gym/pages/widgets/specificPrograms/exercice_container.widget.dart';

class ExercisesList extends StatelessWidget {
  final List<Map<String, dynamic>> exercises;

  const ExercisesList({super.key, required this.exercises});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: List<Widget>.generate(
          exercises.length,
          (index) {
            final title = exercises[index]["title"];
            final imagePath = exercises[index]["imagePath"];
            final info = exercises[index]["info"];
            final time = exercises[index]["time"];
            final graphText = exercises[index]["graphText"];
            return Column(
              children: [
                ExerciseContainer(
                    imagePath: imagePath,
                    title: title,
                    info: info,
                    time: time,
                    graphText: graphText),
                const SizedBox(width: 10),
              ],
            );
          },
        ),
      ),
    );
  }
}
