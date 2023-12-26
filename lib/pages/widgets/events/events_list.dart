import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hangar_gym/backend/events/db_events.dart';
import 'package:hangar_gym/controllers/program_page_controller.dart';
import 'package:hangar_gym/pages/widgets/events/event_container.dart';
import 'package:hangar_gym/pages/widgets/events/events_shimmer.widget.dart';

class EventList extends StatelessWidget {
  EventList({super.key});
  final ProgramPageController controller = Get.find();

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
          if (kDebugMode) {
            print(snapshot.error);
          }
          return const Center(
            child: Text(
              'Faild to get events',
              style: TextStyle(color: Colors.red),
            ),
          );
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
                  final eventId = eventData[index]["id"] ?? "";
                  final eventName = eventData[index]["eventsName"] ?? "";
                  final eventImage = eventData[index]["eventsImage"] ?? "";

                  return Row(
                    children: [
                      EventContainer(
                        eventId: eventId,
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
