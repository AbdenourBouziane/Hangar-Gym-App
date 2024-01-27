import 'package:flutter/material.dart';
import 'package:hangar_gym/pages/widgets/background/background_screen.dart';
import 'package:hangar_gym/pages/widgets/coaches/carousel_slider.widget.dart';
import 'package:hangar_gym/pages/widgets/coaches/coaches_list.widget.dart';
import 'package:hangar_gym/pages/widgets/store/search_bar.widget.dart';

class CoachesPage extends StatefulWidget {
  const CoachesPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CoachesPageState createState() => _CoachesPageState();
}

class _CoachesPageState extends State<CoachesPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  void _updateDisplayedCoaches(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GradienBackground(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CoachCarousel(),
              const SizedBox(
                height: 20,
              ),
              SearchBarStore(
                searchController: _searchController,
                updateDisplayedItems: _updateDisplayedCoaches,
              ),
              const SizedBox(
                height: 20,
              ),
              CoachesList(searchQuery: _searchQuery),
            ],
          ),
        ),
      ),
    );
  }
}
