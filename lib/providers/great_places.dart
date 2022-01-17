import 'dart:ui';

import 'package:flutter/cupertino.dart';
import '../models/place.dart';
import 'dart:io';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];
  List<Place> get items {
    return [..._items];
  }

  void addPlace(String title, File? image) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: title,
        image: image,
        location: null);
    _items.add(newPlace);
    notifyListeners();
  }
}
