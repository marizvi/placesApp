import 'package:flutter/material.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          child: _previewImageUrl == null
              ? Text(
                  'No location Chosen',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl as String,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          children: [
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.location_on),
              label: Text('Current Location',
                  style: TextStyle(color: Theme.of(context).primaryColor)),
            ),
            ElevatedButton.icon(
              onPressed: () {},
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
