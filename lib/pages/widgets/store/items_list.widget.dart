import 'package:flutter/material.dart';
import 'package:hangar_gym/backend/items/db_items.dart';
import 'package:hangar_gym/pages/widgets/store/item_container.widget.dart';
import 'package:hangar_gym/pages/widgets/store/items_shimmer.widget.dart';

class ItemsList extends StatelessWidget {
  const ItemsList({super.key, required this.searchQuery});

  final String searchQuery;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: DbItems().getStoreItemsApi(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ItemsShimmerWidget(),
                SizedBox(width: 8),
                ItemsShimmerWidget(),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<Map<String, dynamic>> storeItems = snapshot.data!;
          if (storeItems.isEmpty) {
            DbItems().insertStoreItems();
          }

          List<Map<String, dynamic>> displayedItems;

          if (searchQuery.isNotEmpty) {
            displayedItems = storeItems.where((item) {
              final itemName = item["itemName"].toLowerCase();
              return itemName.contains(searchQuery.toLowerCase());
            }).toList();
          } else {
            displayedItems = storeItems;
          }

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List<Widget>.generate(
                displayedItems.length,
                (index) {
                  final itemName = displayedItems[index]["itemName"];
                  final itemImage = displayedItems[index]["itemImage"];
                  final itemPrice = displayedItems[index]["itemPrice"];
                  return Row(
                    children: [
                      ItemContainer(
                        itemName: itemName,
                        itemImage: itemImage,
                        itemPrice: itemPrice,
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
