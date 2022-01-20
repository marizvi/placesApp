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
        // appBar: AppBar(title: Text(selectedPlace.title)),
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(selectedPlace.title),
              background: Container(
                height: 250,
                width: double.infinity,
                child: Image.file(
                  selectedPlace.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            )),
        SliverList(
            delegate: SliverChildListDelegate([
          // SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(15),
            child: Text(
              selectedPlace.location!.address as String,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blueGrey, fontSize: 20),
            ),
          ),
          FractionallySizedBox(
            widthFactor: 0.7,
            child: Divider(
              color: Colors.black,
              thickness: 0.8,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          FractionallySizedBox(
            //necessary otherwise button will occupy full width
            widthFactor: 0.3,
            child: MaterialButton(
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
            ),
          ),
          SizedBox(
            height: 600,
          )
        ]))
      ],
    ));
  }
}
