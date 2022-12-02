import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:json_placeholder_workshop/models/models.dart';

class PhotosSwiper extends StatelessWidget {
  const PhotosSwiper({super.key, required this.photos});

  final List<Photo> photos;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Get device size
    if (photos.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: size.height * 0.5,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: photos.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.7,
        itemHeight: size.height * 0.35,
        itemBuilder: (context, index) {
          final Photo photo = photos[index];
          return GestureDetector(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage('${photo.url}.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          );
        },
      ),
    );
  }
}
