import 'package:flutter/material.dart';
import 'package:json_placeholder_workshop/models/models.dart';

class PhotoPreview extends StatelessWidget {
  const PhotoPreview({super.key, required this.photo});

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FadeInImage(
            placeholder: const AssetImage("assets/no-image.jpg"),
            image: NetworkImage("${photo.url}.jpg"),
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: size.width - 170),
              child: Text(photo.title,
                  style: textTheme.headline5,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2),
            ),
            Row(
              children: [
                const Icon(Icons.photo_album_outlined,
                    size: 15, color: Colors.green),
                const SizedBox(width: 5),
                Text(photo.id.toString(), style: textTheme.caption),
              ],
            )
          ],
        ),
      ]),
    );
  }
}
