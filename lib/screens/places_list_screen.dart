import 'package:flutter/material.dart';

class PlaceListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/add_place');
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Center(
        child: Text("hello"),
      ),
    );
  }
}
