import 'package:flutter/material.dart';
import 'package:my_app/screens/add_place_screen.dart';
import 'package:my_app/screens/places_list_screen.dart';
import 'package:provider/provider.dart';
import './providers/great_places.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => GreatPlaces(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
        ),
        // home: ,
        routes: {
          '/': (ctx) => PlaceListScreen(),
          '/add_place': (ctx) => AddPlacesList(),
        },
      ),
    );
  }
}