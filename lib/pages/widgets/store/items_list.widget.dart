import 'package:flutter/material.dart';
import 'package:hangar_gym/backend/items/db_items.dart';
import 'package:hangar_gym/pages/widgets/store/item_container.widget.dart';

class ItemsList extends StatelessWidget {
  const ItemsList({Key? key, required this.searchQuery}) : super(key: key);

  final String searchQuery;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: DbItems().getStoreItems(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<Map<String, dynamic>> storeItems = snapshot.data!;

          // Check if store items are not yet inserted and insert them
          if (storeItems.isEmpty) {
            DbItems().insertStoreItems();
          }

          // Filter items based on search query
          List<Map<String, dynamic>> displayedItems = storeItems
              .where((item) => item['itemName']
                  .toString()
                  .toLowerCase()
                  .contains(searchQuery.toLowerCase()))
              .toList();

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
