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
      drawer: const _HomeDrawer(),
      appBar: AppBar(
        title: const Text('Photos home'),
        elevation: 10,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          PhotosSwiper(photos: getPhotosProvider.photos),
          PhotosSlider(photos: getPhotosProvider.photos),
        ]),
      ),
    );
  }
}

class _HomeDrawer extends StatelessWidget {
  const _HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.purple),
            child: Text(
              'Menu de usuarios',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            title: const Text(
              'Ir a listado de usuarios',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            onTap: () => Navigator.pushNamed(context, 'users'),
          ),
        ],
      ),
    );
  }
}
