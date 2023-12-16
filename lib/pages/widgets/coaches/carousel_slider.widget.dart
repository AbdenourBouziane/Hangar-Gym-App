import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hangar_gym/config/assets.config.dart';

class CoachCarousel extends StatelessWidget {
  final List<String> imageList = [
    Assets.images.hakimCoach,
    Assets.images.hocineCoach,
    Assets.images.leenaCoach,
  ];

  CoachCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 2,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 600),
        viewportFraction: 0.5,
      ),
      items: imageList.map(
        (String imageUrl) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Image(
                  image: AssetImage(
                    imageUrl,
                  ),
                ),
              );
            },
          );
        },
      ).toList(),
    );
  }
}
