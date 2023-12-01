import 'package:get/get.dart';

class NavigationController extends GetxController {
  void navigateToProfilePage() {
    Get.toNamed('/profile');
  }

  void navigateToHomePage() {
    Get.toNamed('/homePage');
  }

  void navigateToEditProfilePage() {
    Get.toNamed('/editProfile');
  }
}
