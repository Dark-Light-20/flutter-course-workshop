import 'dart:convert';

import 'package:json_placeholder_workshop/models/models.dart';

class UsersResponse {
  UsersResponse({required this.users});

  List<User> users;

  factory UsersResponse.fromJson(String str) =>
      UsersResponse.fromMap(json.decode(str));

  factory UsersResponse.fromMap(List<dynamic> json) => UsersResponse(
        users: List<User>.from(json.map((x) => User.fromMap(x))),
      );
}
