import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hangar_gym/config/assets.config.dart';
import 'package:hangar_gym/config/colors.config.dart';
import 'package:hangar_gym/pages/widgets/background/background_screen.dart';
import 'package:hangar_gym/pages/widgets/profile/access_info_container.widget.dart';
import 'package:hangar_gym/utils/constant.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Image.asset(
            Assets.images.frameLogo,
            height: 50,
          ),
          centerTitle: true,
          iconTheme: const IconThemeData(
            color: AppColors.white,
          ),
          backgroundColor: AppColors.mainBlue,
        ),
        body: GradienBackground(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(width: 40),
                  const SizedBox(height: 60),
                  Center(
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(Assets.images.profilePicture),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0.001,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.edit,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  InfoAccess(
                    height: 150,
                    text1: "Edit profile information",
                    text2: "Notifications",
                    text3: "Language",
                    icon1: FontAwesomeIcons.penToSquare,
                    icon2: FontAwesomeIcons.bell,
                    icon3: Icons.language,
                  ),
                  const SizedBox(height: 20),
                  InfoAccess(
                    height: 100,
                    text1: "Security",
                    text2: "Theme",
                    icon1: Icons.security,
                    icon2: FontAwesomeIcons.image,
                  ),
                  const SizedBox(height: 20),
                  InfoAccess(
                    height: 150,
                    text1: "Help & Support",
                    text2: "Contact us",
                    text3: "Privacy Policy",
                    icon1: Icons.help,
                    icon2: Icons.contact_mail_rounded,
                    icon3: Icons.privacy_tip,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 40,
                    width: 120,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(AppColors.white),
                      ),
                      onPressed: () async {
                        await client.auth.signOut();
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/landingPage', (route) => false);
                      },
                      child: const Text(
                        "Logout",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
