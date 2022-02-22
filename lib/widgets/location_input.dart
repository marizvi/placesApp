import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../helpers/locationHelper.dart';
import '../screens/map_screen.dart';

class LocationInput extends StatefulWidget {
  final Function _selectLocation;
  LocationInput(this._selectLocation);
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  // String? _previewImageUrl;

  Future<void> _getCurrenLocation() async {
    final locData = await Location()
        .getLocation(); // will fetch current latitudes and longitudes
    // final staticMapImageUrl = LocationHelper.generateLocationPreviewImage(
    //     latitude: locData.latitude, longitude: locData.longitude);

    // setState(() {
    //   _previewImageUrl = staticMapImageUrl;
    // });
    widget._selectLocation(locData.latitude, locData.longitude);
    print(locData.latitude);
    print(locData.longitude);
  }

  Future<void> _selectOnMap() async {
    final LatLng? selectedLocation = await Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (ctx) => MapScreen(
          isSelecting: true,
        ),
      ),
    );
    if (selectedLocation == null) {
      return;
    }
    widget._selectLocation(
        selectedLocation.latitude, selectedLocation.longitude);
    print(selectedLocation.latitude);
    print(selectedLocation.longitude);
    // ...
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Container(
        //   decoration:
        //       BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
        //   height: 170,
        //   width: double.infinity,
        //   alignment: Alignment.center,
        //   child: _previewImageUrl == null
        //       ? Text(
        //           'No location Chosen',
        //           textAlign: TextAlign.center,
        //         )
        //       : Image.network(
        //           _previewImageUrl ?? '',
        //           fit: BoxFit.cover,
        //           width: double.infinity,
        //         ),
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: _getCurrenLocation,
              icon: Icon(Icons.location_on),
              label: Text('Current Location',
                  style: TextStyle(color: Theme.of(context).primaryColor)),
            ),
            TextButton.icon(
              onPressed: _selectOnMap,
              icon: Icon(Icons.map),
              label: Text('Select on map',
                  style: TextStyle(color: Theme.of(context).primaryColor)),
            )
          ],
        )
      ],
    );
  }
}
