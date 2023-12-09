import 'package:flutter/material.dart';
import 'package:hangar_gym/backend/events/db_events.dart';
import 'package:hangar_gym/pages/widgets/homepage/event_container.dart';

class EventList extends StatelessWidget {
  const EventList({Key? key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: DbEvents().getEvents(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<Map<String, dynamic>> eventData = snapshot.data!;

          // Check if events are not yet inserted and insert them
          if (eventData.isEmpty) {
            DbEvents().insertEvents();
          }

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
      },
    );
  }
}
