import 'package:flutter/material.dart';
import 'package:hangar_gym/config/colors.config.dart';
import 'package:hangar_gym/pages/widgets/background/background_screen.dart';
import 'package:hangar_gym/pages/widgets/store/discount.widget.dart';
import 'package:hangar_gym/pages/widgets/store/items_list.widget.dart';
import 'package:hangar_gym/pages/widgets/store/search_bar.widget.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  void _updateDisplayedItems(String query) {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SearchBarStore(
                  searchController: _searchController,
                  updateDisplayedItems: _updateDisplayedItems,
                ),
              ),
              const SizedBox(height: 20),
              const Discounts(
                text: "10 % Discount on all products",
                color1: AppColors.white,
                color2: AppColors.blueGradient,
              ),
              const SizedBox(height: 20),
              const Text(
                "Best Sales",
                style: TextStyle(
                  fontSize: 26,
                  color: AppColors.white,
                  fontFamily: 'Lato',
                ),
              ),
              const SizedBox(height: 20),
              // Use the SearchBarStore widget
              ItemsList(searchQuery: _searchQuery),
              const SizedBox(height: 20),
              const Text(
                "Best Offers",
                style: TextStyle(
                  fontSize: 26,
                  color: AppColors.white,
                  fontFamily: 'Lato',
                ),
              ),
              const SizedBox(height: 20),
              // Use a separate instance of ItemsList for best offers
              const ItemsList(searchQuery: ''),
            ],
          ),
        ),
      ),
    );
  }
}
