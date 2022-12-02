import 'dart:convert';

import 'package:json_placeholder_workshop/models/models.dart';

class PhotosResponse {
  PhotosResponse({required this.photos});

  List<Photo> photos;

  factory PhotosResponse.fromJson(String str) =>
      PhotosResponse.fromMap(json.decode(str));

  factory PhotosResponse.fromMap(List<dynamic> json) => PhotosResponse(
        // info: Info.fromMap(json["info"]),
        photos: List<Photo>.from(json.map((x) => Photo.fromMap(x))),
      );
}
