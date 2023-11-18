import 'package:flutter/material.dart';
import 'package:hangar_gym/pages/widgets/store/item_container.widget.dart';

class ItemsList extends StatelessWidget {
  final List<Map<String, dynamic>> storeItems;

  const ItemsList({super.key, required this.storeItems});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List<Widget>.generate(
          storeItems.length,
          (index) {
            final itemName = storeItems[index]["itemName"];
            final itemImage = storeItems[index]["itemImage"];
            final itemPrice = storeItems[index]["itemPrice"];
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
}
