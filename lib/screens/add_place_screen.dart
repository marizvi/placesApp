import 'package:flutter/material.dart';

class AddPlacesList extends StatefulWidget {
  @override
  _AddPlacesListState createState() => _AddPlacesListState();
}

class _AddPlacesListState extends State<AddPlacesList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a new place"),
      ),
      body: Column(
        children: [
          Text('User Inputs'),
          ElevatedButton.icon(
              onPressed: () {}, icon: Icon(Icons.add), label: Text('Add')),
        ],
      ),
    );
  }
}
