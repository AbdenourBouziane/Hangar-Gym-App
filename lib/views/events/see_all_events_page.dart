import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hangar_gym/config/colors.config.dart';
import 'package:hangar_gym/controllers/program_page_controller.dart';
import 'package:hangar_gym/backend/events/db_events.dart';
import 'package:hangar_gym/pages/widgets/background/background_screen.dart';
import 'package:hangar_gym/pages/widgets/events/all_events_container.widget.dart';
import 'package:hangar_gym/pages/widgets/events/all_events_shimmer.widget.dart';

class AllEventsPage extends StatelessWidget {
  AllEventsPage({Key? key}) : super(key: key);

  final ProgramPageController controller = Get.find();

  Future<List<Map<String, dynamic>>> _fetchEventData() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      throw Exception('No internet connection');
    }

    return DbEvents().getEventsFromApi();
  }

  Widget _buildErrorWidget(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Check your internet connection and try again.',
            style: TextStyle(color: Colors.red),
          ),
        ],
      ),
    );
  }

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
              future: _fetchEventData(),
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
                  return _buildErrorWidget(context);
                } else {
                  List<Map<String, dynamic>> eventData = snapshot.data!;

                  if (eventData.isEmpty) {
                    return const Center(
                      child: Text(
                        'No events available.',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }

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
