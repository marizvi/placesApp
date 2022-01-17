import 'package:flutter/material.dart';
import 'package:my_app/providers/great_places.dart';
import 'package:provider/provider.dart';
import 'dart:io';

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
          child: FutureBuilder(
              future: Provider.of<GreatPlaces>(context, listen: false)
                  .fetchAndSetPlaces(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else
                  return Consumer<GreatPlaces>(
                    child: Center(
                      child: Text("Got no places yet, start adding some"),
                    ),
                    builder: (ctx, greaPlaces, ch) =>
                        greaPlaces.items.length <= 0
                            ? ch as Widget
                            : ListView.builder(
                                itemBuilder: (ctx, i) => ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: FileImage(
                                        greaPlaces.items[i].image as File),
                                  ),
                                  title: Text(greaPlaces.items[i].title),
                                  onTap: () {},
                                ),
                                itemCount: greaPlaces.items.length,
                              ),
                  );
              }),
        ));
  }
}
