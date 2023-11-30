import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hangar_gym/config/colors.config.dart';

class BottomBarController extends GetxController {
  RxInt buttomSelectedIndex = 0.obs;

  PageController pageController =
      PageController(initialPage: 0, keepPage: true);

  void bottomBarIsClicked(int index) {
    buttomSelectedIndex.value = index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
    customizeBottomNavigationBar();
  }

  void pageChangedViaSliding(int index) {
    buttomSelectedIndex.value = index;
    customizeBottomNavigationBar();
  }

  void customizeBottomNavigationBar() {
    BottomNavigationBarThemeData theme = const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(color: AppColors.mainRed),
      unselectedIconTheme: IconThemeData(color: AppColors.white),
    );

    Get.changeTheme(
      ThemeData(bottomNavigationBarTheme: theme),
    );
  }
}
