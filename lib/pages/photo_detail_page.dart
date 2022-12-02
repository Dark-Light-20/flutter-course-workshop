import 'package:flutter/material.dart';
import 'package:json_placeholder_workshop/models/models.dart';
import 'package:json_placeholder_workshop/widgets/widgets.dart';

class PhotoDetailPage extends StatelessWidget {
  const PhotoDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Photo photo = ModalRoute.of(context)?.settings.arguments as Photo;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(photo: photo),
          SliverList(
            delegate: SliverChildListDelegate([
              PhotoPreview(photo: photo),
              const PhotoOverview(),
              const PhotoOverview(),
              const PhotoOverview(),
              const PhotoOverview(),
              const PhotoOverview(),
              const PhotoOverview(),
              const PhotoOverview(),
              const PhotoOverview(),
              const PhotoOverview(),
            ]),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({super.key, required this.photo});

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.purple,
      expandedHeight: 200,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            child: Text(
              photo.title,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            )),
        background: FadeInImage(
          placeholder: const AssetImage("assets/no-image.jpg"),
          image: NetworkImage('${photo.url}.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
