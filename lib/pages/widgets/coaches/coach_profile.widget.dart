import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hangar_gym/config/colors.config.dart';

class CoachProfile extends StatelessWidget {
  const CoachProfile({
    Key? key,
    required this.coacheName,
    required this.coachPicture,
    required this.coachProfession,
  }) : super(key: key);

  final String coacheName;
  final String coachPicture;
  final String coachProfession;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.white,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(coachPicture),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            coacheName,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lato',
            ),
          ),
          const SizedBox(height: 10),
          Text(
            coachProfession,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 20,
              fontFamily: 'Lato',
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.instagram,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.whatsapp,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.tiktok,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
