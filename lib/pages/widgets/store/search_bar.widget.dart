import 'package:flutter/material.dart';
import 'package:hangar_gym/config/colors.config.dart';

class SearchBarStore extends StatelessWidget {
  final TextEditingController searchController;
  final Function(String) updateDisplayedItems;

  const SearchBarStore({
    Key? key,
    required this.searchController,
    required this.updateDisplayedItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      onChanged: updateDisplayedItems,
      decoration: const InputDecoration(
        border: InputBorder.none,
        labelText: 'Search for items',
        labelStyle: TextStyle(
          color: AppColors.white,
        ),
        prefixIcon: Icon(
          Icons.search,
          color: AppColors.white,
        ),
      ),
    );
  }
}