import 'package:flutter/material.dart';
import 'package:json_placeholder_workshop/models/models.dart';

class UserPreview extends StatelessWidget {
  const UserPreview({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        _DataRow(title: 'Nombre:', text: user.name),
        const SizedBox(height: 10),
        _DataRow(title: 'Email:', text: user.email),
        const SizedBox(height: 10),
        _DataRow(title: 'Telefono:', text: user.phone),
        const SizedBox(height: 10),
        _DataRow(title: 'Website:', text: user.website),
      ]),
    );
  }
}

class _DataRow extends StatelessWidget {
  const _DataRow({super.key, required this.text, required this.title});

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(fontSize: 25),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
