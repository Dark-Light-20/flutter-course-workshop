import 'package:flutter/material.dart';
import 'package:json_placeholder_workshop/models/models.dart';
import 'package:json_placeholder_workshop/widgets/widgets.dart';

class UserDetailPage extends StatelessWidget {
  const UserDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context)?.settings.arguments as User;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Info usuario'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushReplacementNamed(context, 'home'),
            icon: const Icon(Icons.home),
          )
        ],
      ),
      body: UserPreview(user: user),
    );
  }
}
