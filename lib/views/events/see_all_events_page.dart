import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hangar_gym/config/colors.config.dart';
import 'package:hangar_gym/controllers/program_page_controller.dart';
import 'package:hangar_gym/backend/events/db_events.dart';
import 'package:hangar_gym/pages/widgets/background/background_screen.dart';
import 'package:hangar_gym/pages/widgets/events/all_events_container.widget.dart';
import 'package:hangar_gym/pages/widgets/events/all_events_shimmer.widget.dart';

class AllEventsPage extends StatelessWidget {
  AllEventsPage({super.key});

  final ProgramPageController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GradienBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Events List",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
                fontFamily: 'Lato',
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: DbEvents().getEventsFromApi(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: [
                          AllEventsShimmer(),
                          SizedBox(height: 10),
                          AllEventsShimmer(),
                          SizedBox(height: 10),
                          AllEventsShimmer(),
                          SizedBox(height: 10),
                          AllEventsShimmer(),
                          SizedBox(height: 10),
                          AllEventsShimmer(),
                        ],
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  if (kDebugMode) {
                    print(snapshot.error);
                  }
                  return const Center(
                    child: Text(
                      "Failed to get all events",
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                } else {
                  List<Map<String, dynamic>> eventData = snapshot.data!;

                  return ListView.builder(
                    itemCount: eventData.length,
                    itemBuilder: (context, index) {
                      final eventName =
                          eventData[index]["eventsName"] as String?;
                      final eventImage =
                          eventData[index]["eventsImage"] as String?;
                      final eventDate =
                          eventData[index]["eventDate"] as String?;

                      return CustomEventContainer(
                        eventName: eventName ?? "",
                        eventImage: eventImage ?? "",
                        eventId: eventData[index]["id"],
                        eventDate: eventDate ?? "",
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
