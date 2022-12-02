import 'package:flutter/material.dart';
import 'package:json_placeholder_workshop/providers/providers.dart';
import 'package:provider/provider.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final getUsersProvider = Provider.of<UsersProvider>(context, listen: true);
    final users = getUsersProvider.users;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Usuarios'),
      ),
      body: SafeArea(
        child: ReorderableListView.builder(
          onReorder: (oldIndex, newIndex) {
            if (oldIndex < newIndex) {
              newIndex--; // Fix index when deleted downside
            }
            // We have to remove old index
            final user = users.removeAt(oldIndex);
            // And insert its value to new index
            users.insert(newIndex, user);
          },
          itemBuilder: (context, index) {
            final user = users[index];
            return ListTile(
              leading: const Icon(Icons.person),
              trailing: const Icon(Icons.arrow_forward_ios, size: 20),
              key: ValueKey<int>(user.id),
              title: Text(
                user.name,
                style: const TextStyle(fontSize: 30),
              ),
              onTap: () {},
            );
          },
          itemCount: users.length,
        ),
      ),
    );
  }
}
