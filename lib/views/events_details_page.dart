import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hangar_gym/config/colors.config.dart';
import 'package:hangar_gym/controllers/program_page_controller.dart';
import 'package:hangar_gym/backend/events/db_events.dart';
import 'package:hangar_gym/pages/widgets/background/background_screen.dart';
import 'package:hangar_gym/pages/widgets/events/detaild_events_shimmer.widget.dart';

class EventsDetailsPage extends StatelessWidget {
  EventsDetailsPage({Key? key}) : super(key: key);

  final ProgramPageController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final int selectedEventId = controller.selectedEventId.value;

    return FutureBuilder<List<Map<String, dynamic>>>(
      future: DbEvents().getEventsFromApi(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const GradienBackground(
            child: ShimmerEventDetailedContainer(),
          );
        } else if (snapshot.hasError) {
          return GradienBackground(
            child: Center(
              child: Text(
                "Error fetching event details: ${snapshot.error}",
                style: const TextStyle(color: AppColors.white),
              ),
            ),
          );
        } else {
          List<Map<String, dynamic>> eventData = snapshot.data!;

          Map<String, dynamic> selectedEvent = eventData.firstWhere(
            (event) => event['id'] == selectedEventId,
            orElse: () => <String, dynamic>{},
          );

          return GradienBackground(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    selectedEvent["eventsName"] as String? ?? "",
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lato',
                    ),
                  ),
                  const SizedBox(height: 30),
                  Image.network(
                    selectedEvent["eventsImage"] as String? ?? "",
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      selectedEvent["eventsDescription"] as String? ?? "",
                      softWrap: true,
                      maxLines: 10,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 18,
                        fontFamily: 'Lato',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
