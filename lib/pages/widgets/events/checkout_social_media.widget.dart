import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hangar_gym/config/colors.config.dart';
import 'package:url_launcher/url_launcher.dart';

class CheckoutSocialMedia extends StatelessWidget {
  const CheckoutSocialMedia({super.key});

  void launcherInstagram() async {
    final url = Uri.parse('https://www.instagram.com/thehangargym_dz/');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch the URL';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 55,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              AppColors.mainBlue,
              AppColors.mainRed,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Check out the event's reels",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontFamily: 'Lato',
                ),
              ),
              IconButton(
                onPressed: () {
                  launcherInstagram();
                },
                icon: const FaIcon(
                  FontAwesomeIcons.play,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
