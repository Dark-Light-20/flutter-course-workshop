import 'package:flutter/material.dart';
import 'package:json_placeholder_workshop/providers/providers.dart';
import 'package:json_placeholder_workshop/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final getPhotosProvider =
        Provider.of<PhotosProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photos home'),
        elevation: 10,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          PhotosSwiper(photos: getPhotosProvider.photos),
        ]),
      ),
    );
  }
}
