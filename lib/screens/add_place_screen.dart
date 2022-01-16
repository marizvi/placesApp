import 'package:flutter/material.dart';
import 'package:my_app/widgets/image_input.dart';

class AddPlacesList extends StatefulWidget {
  @override
  _AddPlacesListState createState() => _AddPlacesListState();
}

class _AddPlacesListState extends State<AddPlacesList> {
  final _titleController = TextEditingController();

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
                  ImageInput(),
                ],
              ),
            ),
          ),

          // Spacer(),
          ElevatedButton.icon(
              onPressed: () {},
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
