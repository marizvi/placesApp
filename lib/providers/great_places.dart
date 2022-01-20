import 'package:flutter/cupertino.dart';
import '../models/place.dart';
import 'dart:io';
import '../helpers/db_helper.dart';
import '../helpers/locationHelper.dart';
// import 'package:geocode/geocode.dart';
import 'package:geocoder/geocoder.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];
  List<Place> get items {
    return [..._items];
  }

  Future<void> addPlace(
      String title, File? image, PlaceLocation pickedLocation) async {
    // human readable address
    // final address = await LocationHelper.getPlaceAddress(
    //     pickedLocation.latitude, pickedLocation.longitude);

    final coordinates =
        new Coordinates(pickedLocation.latitude, pickedLocation.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var address = '${addresses.first.addressLine}';

    //use below geocodinig technique if geocoder gets completeley
    //deparcated
    ////for this import package:geocode/geocode.dart
    // GeoCode geoCode = GeoCode();
    // final addresses = await geoCode.reverseGeocoding(
    //     latitude: pickedLocation.latitude, longitude: pickedLocation.longitude);

    // final address =
    //     '${addresses.streetAddress}, ${addresses.city}, ${addresses.region}';

    final updatedLocation = PlaceLocation(
        latitude: pickedLocation.latitude,
        longitude: pickedLocation.longitude,
        address: address);
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: title,
        image: image as File,
        location: updatedLocation);
    _items.add(newPlace);
    notifyListeners();
    //we cannot store data in form of maps on sqllite
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
      'loc_lat': newPlace.location!.latitude,
      'loc_lng': newPlace.location!.longitude,
      'address': newPlace.location!.address as String,
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final datalist = await DBHelper.getData('user_places');
    // [
    //   {
    //     'a':'nbn'
    //   }
    //   {
    //     'a':'hjv'
    //   }
    // ]

    _items = datalist
        .map((item) => Place(
            id: item['id'] as String,
            title: item['title'] as String,
            image: File(item['image'] as String),
            location: PlaceLocation(
                latitude: item['loc_lat'] as double,
                longitude: item['loc_lng'] as double,
                address: item['address'] as String)))
        .toList();
    notifyListeners();
  }

  Place findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }
}
