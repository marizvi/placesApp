import 'package:flutter/material.dart';
import 'package:my_app/widgets/image_input.dart';
import 'package:my_app/widgets/location_input.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import '../providers/great_places.dart';

class AddPlacesList extends StatefulWidget {
  @override
  _AddPlacesListState createState() => _AddPlacesListState();
}

class _AddPlacesListState extends State<AddPlacesList> {
  final _titleController = TextEditingController();
  File? _pickedImage;
  void _selectImage(File pickedImage) {
    this._pickedImage = pickedImage;
  }

  void _savePlace() {
    if (_titleController.text.isEmpty || _pickedImage == null) {
      print('Error: Fields are empty');
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: Text(
                  'Error Occured!',
                ),
                content: Text('Cannot submit empty fields.. '),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Okay')),
                ],
              ));
      return;
    }
    final places = Provider.of<GreatPlaces>(context, listen: false);
    places.addPlace(_titleController.text, _pickedImage);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a new place"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment:
            CrossAxisAlignment.stretch, //will make the submit button stretched
        children: [
          Expanded(
            // will take all extra available space
            //doing this to not to make button scrollable
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                //
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'title'),
                      controller: _titleController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ImageInput(_selectImage),
                    SizedBox(
                      height: 10,
                    ),
                  LocationInput()
                  ],
                ),
              ),
            ),
          ),

          // Spacer(),
          ElevatedButton.icon(
              onPressed: _savePlace,
              icon: Icon(Icons.add),
              label: Text('Add'),
              style: ElevatedButton.styleFrom(
                  //to remove extra margins
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap)),
        ],
      ),
    );
  }
}
