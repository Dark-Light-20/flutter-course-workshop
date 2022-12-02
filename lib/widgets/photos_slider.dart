import 'package:flutter/material.dart';
import 'package:json_placeholder_workshop/models/models.dart';

class PhotosSlider extends StatefulWidget {
  const PhotosSlider({super.key, required this.photos});

  final List<Photo> photos;

  @override
  State<PhotosSlider> createState() => _PhotosSliderState();
}

class _PhotosSliderState extends State<PhotosSlider> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: Column(children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Photos available',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 30),
        Expanded(
            child: ListView.builder(
          itemCount: widget.photos.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => _PhotoItem(
            photo: widget.photos[index],
          ),
        ))
      ]),
    );
  }
}

class _PhotoItem extends StatelessWidget {
  const _PhotoItem({super.key, required this.photo});

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 130,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(children: [
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, "detail", arguments: photo),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: const AssetImage("assets/no-image.jpg"),
              image: NetworkImage('${photo.url}.jpg'),
              width: 120,
              height: 130,
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          photo.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        )
      ]),
    );
  }
}
