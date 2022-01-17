import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageInput extends StatefulWidget {
  final Function onSelectImage;
  ImageInput(this.onSelectImage);
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;
  Future<void> _takePicture() async {
    //ImagePicker retirns a future
    // final picker = await ImagePicker();
    //can also chose ImageSource.gallery
    final _picker = ImagePicker();
    final image =
        await _picker.pickImage(source: ImageSource.camera, maxWidth: 600);
    setState(() {
      _storedImage = File(image!.path);
    });

    //now sotring it on device
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(image!.path);
    final saveImage = await File(image.path).copy('${appDir.path}/$fileName');
    widget.onSelectImage(saveImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //preview
        Container(
          margin: EdgeInsets.only(left: 8),
          width: 150,
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
                  'No Image Taken',
                  textAlign: TextAlign.center,
                ),
        ),
        Expanded(
          child: TextButton.icon(
              onPressed: _takePicture,
              icon: Icon(Icons.camera),
              label: Text("Take Picture")),
        ),
      ],
    );
  }
}
