import 'package:flutter/material.dart';
import 'package:hangar_gym/config/colors.config.dart';

class ItemContainer extends StatelessWidget {
  const ItemContainer({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.itemImage,
  });

  final String itemName;
  final String itemPrice;
  final String itemImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.blueSecondary,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            itemImage,
            height: 190,
            width: 140,
          ),
          Text(
            itemName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lato',
            ),
          ),
          const SizedBox(height: 10),
          Text(
            itemPrice,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Lato',
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
