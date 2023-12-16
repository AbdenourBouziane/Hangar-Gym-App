import 'package:flutter/material.dart';
import 'package:hangar_gym/backend/events/db_events.dart';
import 'package:hangar_gym/pages/widgets/events/event_container.dart';
import 'package:hangar_gym/pages/widgets/events/events_shimmer.widget.dart';

class EventList extends StatelessWidget {
  const EventList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: DbEvents().getEventsFromApi(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                EventsShimmerContainer(),
                SizedBox(width: 10),
                EventsShimmerContainer(),
                SizedBox(width: 10),
                EventsShimmerContainer(),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<Map<String, dynamic>> eventData = snapshot.data!;

          if (eventData.isEmpty) {
            DbEvents().insertEvents();
          }

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List<Widget>.generate(
                eventData.length,
                (index) {
                  final eventName = eventData[index]["eventsName"];
                  final eventImage = eventData[index]["eventsImage"];

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
