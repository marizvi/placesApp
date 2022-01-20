import 'package:flutter/material.dart';
import 'package:my_app/providers/great_places.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:flutter_svg/flutter_svg.dart';

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
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: //AssetImage('lib/assets/images/bac.jpg'),
                      AssetImage('lib/assets/images/bac4.jpg'),
                  fit: BoxFit.cover,
                  opacity: 0.7)),
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
                            : Container(
                                margin: EdgeInsets.only(top: 5),
                                padding: EdgeInsets.all(8),
                                child: ListView.builder(
                                  itemBuilder: (ctx, i) => Card(
                                    color: Colors.white.withOpacity(0.9),
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage: FileImage(
                                            greaPlaces.items[i].image as File),
                                      ),
                                      title: Text(greaPlaces.items[i].title),
                                      subtitle: Text(greaPlaces.items[i]
                                          .location!.address as String),
                                      onTap: () {
                                        Navigator.of(context).pushNamed(
                                            '/place_detail',
                                            arguments: greaPlaces.items[i].id);
                                      },
                                    ),
                                  ),
                                  itemCount: greaPlaces.items.length,
                                ),
                              ),
                  );
              }),
        ));
  }
}
