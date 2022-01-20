import 'package:flutter/material.dart';
import 'package:my_app/models/place.dart';
import 'package:my_app/screens/map_screen.dart';
import 'package:provider/provider.dart';
import '../providers/great_places.dart';

class PlaceDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments;
    final selectedPlace =
        Provider.of<GreatPlaces>(context, listen: false).findById(id as String);
    return Scaffold(
      appBar: AppBar(title: Text(selectedPlace.title)),
      body: Column(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            child: Image.file(
              selectedPlace.image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          SizedBox(height: 20),
          Text(
            selectedPlace.location!.address as String,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          MaterialButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MapScreen(
                  initialLocation: selectedPlace.location as PlaceLocation,
                ),
              ));
            },
            splashColor: Colors.pink[300],
            elevation: 5,
            color: Colors.pink,
            textColor: Colors.white,
            child: Text('View on Map'),
          )
        ],
      ),
    );
  }
}
