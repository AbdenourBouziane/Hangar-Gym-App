import 'package:flutter/material.dart';
import 'package:hangar_gym/config/assets.config.dart';
import 'package:path/path.dart';
import 'package:url_launcher/url_launcher.dart';

class SessionsContainer extends StatelessWidget {
  const SessionsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        launchUrl(
          url.toUri(
              'https://l.facebook.com/l.php?u=https%3A%2F%2Fmaps.app.goo.gl%2FUKEiiTCQeK7kHRFr5%3Fg_st%3Dic%26fbclid%3DIwAR34CNle4RCAwKke6G1cGGCvjYV4UuEq90yZWR9lwERmWW_hQL3k7h6A99E&h=AT0YnLhZnqvZ_EkScBxJnjX6bZoOeYRgWlqdq9FN1zG4BByvmsr9YU2nKXcfp9TaUQp1kv4-v-6v5HmAlwAH4qZvezRElg8TOazVglZ5Xvnk_Xva99x9awCQO5MCnn32IbDX9A'),
        );
      },
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(
              Assets.images.location,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
