import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hangar_gym/config/assets.config.dart';
import 'package:hangar_gym/config/colors.config.dart';
import 'package:hangar_gym/controllers/bottom_bar_controller.dart';
import 'package:hangar_gym/controllers/navigation_controller.dart';
import 'package:hangar_gym/controllers/program_page_controller.dart';
import 'package:hangar_gym/utils/constant.dart';
import 'package:hangar_gym/views/all_programs_page.dart';
import 'package:hangar_gym/pages/screens/classes/classes_page.dart';
import 'package:hangar_gym/views/coaches_page.dart';
import 'package:hangar_gym/views/events/events_details_page.dart';
import 'package:hangar_gym/views/events/see_all_events_page.dart';
import 'package:hangar_gym/views/info_page.dart';
import 'package:hangar_gym/views/program_page.dart';
import 'package:hangar_gym/views/specific_program_page.dart';
import 'package:hangar_gym/views/store_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatefulWidget {
  final BottomBarController bottomBarController =
      Get.put(BottomBarController());

  final ProgramPageController programPageController =
      Get.put(ProgramPageController());

  final NavigationController navigationController =
      Get.put(NavigationController());

  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user;
  @override
  void initState() {
    setState(() {
      user = client.auth.currentUser;
    });
    client.auth.onAuthStateChange.listen((event) {
      setState(() {
        user = event.session?.user;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
              widget.navigationController.naviagteToQrCodePage();
            },
          ),
        ],
      ),
      drawer: SafeArea(child: _buildDrawer()),
      bottomNavigationBar: getBottomBarWidget(context),
      body: PageView(
        controller: widget.bottomBarController.pageController,
        onPageChanged: (index) {
          widget.bottomBarController.pageChangedViaSliding(index);
        },
        children: [
          Obx(
            () {
              if (widget.programPageController.isClassClicked.value) {
                return ClassesPage();
              } else if (widget.programPageController.isDetailsClicked.value) {
                return EventsDetailsPage();
              } else if (widget
                  .programPageController.isSeeAllEventsClicked.value) {
                return AllEventsPage();
              } else {
                return InfoPage();
              }
            },
          ),
          const StorePage(),
          const CoachesPage(),
          Obx(
            () {
              if (widget.programPageController.isSeeAllClicked.value) {
                return AllPrograms();
              } else if (widget.programPageController.isSeeMoreClicked.value) {
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
          if (user != null)
            UserAccountsDrawerHeader(
              accountName: Text(_getUserName(user!.email ?? 'Guest')),
              accountEmail: Text(user!.email ?? ''),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(Assets.images.profilePicture),
              ),
              decoration: const BoxDecoration(
                color: AppColors.mainRed,
              ),
            ),
          if (user == null)
            Column(
              children: [
                UserAccountsDrawerHeader(
                  accountName: const Text('Guest'),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage(Assets.images.profilePicture),
                  ),
                  decoration: const BoxDecoration(
                    color: AppColors.mainRed,
                  ),
                  accountEmail: null,
                ),
                ListTile(
                  onTap: () {
                    widget.navigationController.naviagteToLoginPage();
                  },
                  title: const Text(
                    'Login',
                    style: TextStyle(
                      color: AppColors.white,
                      fontFamily: 'Lato',
                      fontSize: 16,
                    ),
                  ),
                  leading: const Icon(
                    Icons.login,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          user == null
              ? const Text('')
              : GestureDetector(
                  onTap: () {
                    widget.navigationController.navigateToProfilePage();
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

  String _getUserName(String email) {
    List<String> parts = email.split('@');
    return parts.isNotEmpty ? parts[0] : 'Default Username';
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
          fontFamily: 'Lato',
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
            widget.bottomBarController.bottomBarIsClicked(index);
          },
          currentIndex: widget.bottomBarController.buttomSelectedIndex.toInt(),
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
