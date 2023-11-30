import 'package:flutter/material.dart';
import 'package:hangar_gym/config/assets.config.dart';
import 'package:hangar_gym/config/colors.config.dart';
import 'package:hangar_gym/pages/screens/profile_page.dart';

class HeaderAppBar extends StatelessWidget {
  const HeaderAppBar({super.key});

  Future<void> _showDrawer(BuildContext context) async {
    return showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            color: AppColors.mainBlue,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: AppColors.mainRed,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(Assets.images.profilePicture),
                      radius: 40,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'John Doe',
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'john.doe@example.com',
                      style: TextStyle(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.report, color: AppColors.white),
                title: const Text(
                  'Report',
                  style: TextStyle(color: AppColors.white),
                ),
                onTap: () {
                  // Handle the report action
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings, color: AppColors.white),
                title: const Text(
                  'Settings',
                  style: TextStyle(color: AppColors.white),
                ),
                onTap: () {
                  // Handle the settings action
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: AppColors.white),
                title: const Text(
                  'Sign Out',
                  style: TextStyle(color: AppColors.white),
                ),
                onTap: () {
                  // Handle the sign out action
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                leading: const Icon(Icons.share, color: AppColors.white),
                title: const Text(
                  'Share and Invite',
                  style: TextStyle(color: AppColors.white),
                ),
                onTap: () {
                  // Handle the share and invite action
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                leading: const Icon(Icons.help, color: AppColors.white),
                title: const Text(
                  'Help and Feedback',
                  style: TextStyle(color: AppColors.white),
                ),
                onTap: () {
                  // Handle the help and feedback action
                  Navigator.pop(context); // Close the drawer
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      floating: false,
      pinned: true,
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      expandedHeight: 100,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.mainRed, AppColors.mainBlue],
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => _showDrawer(context),
              icon: const Icon(
                Icons.menu,
                color: AppColors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                Assets.images.frameLogo,
                height: 62,
                width: 114,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfilePage(),
                  ),
                );
              },
              icon: const Icon(
                Icons.person,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
