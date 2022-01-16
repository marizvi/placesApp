import 'package:flutter/material.dart';
import 'dart:io';

class ImageInput extends StatefulWidget {
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //preview
        Container(
          width: 100,
          height: 100,
          alignment: Alignment.center,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          child: _storedImage != null
              ? Image.file(_storedImage as File,
                  fit: BoxFit.cover,
                  width: double
                      .infinity //image can take full width of surrounding container,
                  )
              : Text(
                  'No image taken',
                  textAlign: TextAlign.center,
                ),
        ),
        Expanded(
          child: TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.camera),
              label: Text("Take Picture")),
        ),
      ],
    );
  }
}
