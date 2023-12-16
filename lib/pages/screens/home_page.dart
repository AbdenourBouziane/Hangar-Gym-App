import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hangar_gym/config/assets.config.dart';
import 'package:hangar_gym/config/colors.config.dart';
import 'package:hangar_gym/controllers/bottom_bar_controller.dart';
import 'package:hangar_gym/controllers/navigation_controller.dart';
import 'package:hangar_gym/controllers/program_page_controller.dart';
import 'package:hangar_gym/views/all_programs_page.dart';
import 'package:hangar_gym/pages/screens/classes_page.dart';
import 'package:hangar_gym/views/coaches_page.dart';
import 'package:hangar_gym/views/info_page.dart';
import 'package:hangar_gym/views/program_page.dart';
import 'package:hangar_gym/views/specific_program_page.dart';
import 'package:hangar_gym/views/store_page.dart';

class HomePage extends StatelessWidget {
  final BottomBarController bottomBarController =
      Get.put(BottomBarController());

  final ProgramPageController programPageController =
      Get.put(ProgramPageController());

  final NavigationController navigationController =
      Get.put(NavigationController());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.mainBlue,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Image.asset(
              Assets.images.frameLogo,
              height: 47,
              width: 99,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.qr_code),
            onPressed: () {
              navigationController.naviagteToQrCodePage();
            },
          ),
        ],
      ),
      drawer: _buildDrawer(),
      bottomNavigationBar: getBottomBarWidget(context),
      body: PageView(
        controller: bottomBarController.pageController,
        onPageChanged: (index) {
          bottomBarController.pageChangedViaSliding(index);
        },
        children: [
          Obx(
            () {
              if (programPageController.isClassClicked.value) {
                return ClassesPage();
              } else {
                return InfoPage();
              }
            },
          ),
          const StorePage(),
          const CoachesPage(),
          Obx(
            () {
              if (programPageController.isSeeAllClicked.value) {
                return AllPrograms();
              } else if (programPageController.isSeeMoreClicked.value) {
                return SpecificProgram();
              } else {
                return ProgramPage();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: AppColors.mainBlue,
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Abdenour Bouziane'),
            accountEmail: const Text('abdenour@bouziane.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage(Assets.images.profilePicture),
            ),
            decoration: const BoxDecoration(
              color: AppColors.mainRed,
            ),
          ),
          GestureDetector(
            onTap: () {
              navigationController.navigateToProfilePage();
            },
            child: _buildListTile(Icons.person, 'Profile'),
          ),
          _buildListTile(Icons.message, 'Message'),
          _buildListTile(Icons.report, 'Report'),
          _buildListTile(Icons.settings, 'Settings'),
          _buildListTile(Icons.exit_to_app, 'Sign Out'),
          _buildListTile(Icons.share, 'Share and Invite'),
          _buildListTile(Icons.help, 'Help and Feedback'),
        ],
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(
        icon,
        color: AppColors.white,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.white,
        ),
      ),
    );
  }

  Widget getBottomBarWidget(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      height: 65,
      width: size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(36),
          topLeft: Radius.circular(36),
        ),
      ),
      child: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.mainRed,
          selectedItemColor: AppColors.white,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (index) {
            bottomBarController.bottomBarIsClicked(index);
          },
          currentIndex: bottomBarController.buttomSelectedIndex.toInt(),
          selectedIconTheme: const IconThemeData(size: 30),
          selectedLabelStyle: const TextStyle(height: 0),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 24),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, size: 24),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group, size: 24),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.dumbbell, size: 24),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}
