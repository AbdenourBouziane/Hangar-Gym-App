import 'package:flutter/material.dart';
import 'package:hangar_gym/pages/widgets/homepage/event_container.dart';

class EventList extends StatelessWidget {
  final List<Map<String, dynamic>> eventData;

  const EventList({super.key, required this.eventData});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List<Widget>.generate(
          eventData.length,
          (index) {
            final eventName = eventData[index]["eventName"];
            final eventImage = eventData[index]["eventImage"];
            return Row(
              children: [
                EventContainer(
                  eventName: eventName,
                  eventImage: eventImage,
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
