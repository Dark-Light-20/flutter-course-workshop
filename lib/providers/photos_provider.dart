import 'package:flutter/material.dart';
import 'package:json_placeholder_workshop/models/models.dart';
import 'package:http/http.dart' as http;

class PhotosProvider extends ChangeNotifier {
  final String _baseUrl = "jsonplaceholder.typicode.com";
  List<Photo> photos = [];

  PhotosProvider() {
    getPhotos();
  }

  getPhotos() async {
    final url = Uri.https(_baseUrl, '/photos');
    final response = await http.get(url);

    if (response.statusCode != 200) return [];

    final dataResponse = PhotosResponse.fromJson(response.body);
    photos = dataResponse.photos;
    notifyListeners();
  }
}
