import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:json_placeholder_workshop/models/models.dart';
import 'package:http/http.dart' as http;

class UsersProvider extends ChangeNotifier {
  final String _baseUrl = "jsonplaceholder.typicode.com";
  List<User> users = [];

  UsersProvider() {
    getUsers();
  }

  getUsers() async {
    final url = Uri.https(_baseUrl, '/users');
    final response = await http.get(url);

    if (response.statusCode != 200) return [];

    final dataResponse = UsersResponse.fromJson(response.body);
    users = dataResponse.users;
    notifyListeners();
  }
}
