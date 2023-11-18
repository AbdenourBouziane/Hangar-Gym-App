import 'package:flutter/material.dart';
import 'package:hangar_gym/config/colors.config.dart';
import 'package:hangar_gym/data/store_items.dart';
import 'package:hangar_gym/pages/widgets/background/background_screen.dart';
import 'package:hangar_gym/pages/widgets/store/discount.widget.dart';
import 'package:hangar_gym/pages/widgets/store/items_list.widget.dart';
import 'package:hangar_gym/views/appbar.dart';
import 'package:hangar_gym/views/bottombar.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GradienBackground(
          child: CustomScrollView(
            slivers: <Widget>[
              const HeaderAppBar(),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Discounts(),
                      const SizedBox(height: 20),
                      const Text(
                        "Best Sales",
                        style: TextStyle(
                          fontSize: 26,
                          color: AppColors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ItemsList(
                        storeItems: storeItems,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Best Offers",
                        style: TextStyle(
                          fontSize: 26,
                          color: AppColors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ItemsList(
                        storeItems: storeItems,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const NavigationBottomBar(),
    );
  }
}
