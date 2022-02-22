import 'package:http/http.dart' as http;
import 'package:flutter_config/flutter_config.dart';

import 'dart:convert';

final GOOGLE_API_KEY = FlutterConfig.get('GOOGLE_MAPS_API_KEY');

class LocationHelper {
  static String generateLocationPreviewImage(
      {required double? latitude, required double? longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }

  ///below is google geocoding part which is not currently in use
  // beause we have to create billing account
  // static Future<String> getPlaceAddress(double lat, double long) async {
  //   final url = Uri.parse(
  //       "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$long&amp;key=$GOOGLE_API_KEY");
  //   final response = await http.get(url);
  //   print("after get place address");
  //   print(json.decode(response.body));
  //   return "latitude: $lat and longitude: $long";
  // }
}
