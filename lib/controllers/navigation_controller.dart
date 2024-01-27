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

  void naviagteToQrCodePage() {
    Get.toNamed('/qrcode');
  }

  void naviagteToLoginPage() {
    Get.toNamed('/loginPage');
  }

  void naviagteToSignUpPage() {
    Get.toNamed('/signupPage');
  }
}
