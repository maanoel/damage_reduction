import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SubstancePage extends StatefulWidget {
  @override
  _SbustancePageState createState() => _SbustancePageState();
}

class _SbustancePageState extends State {

  File _image;

  Future getImageFromCam() async { // for camera
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  Future getImageFromGallery() async {// for gallery
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text('Nova substância'),
        ),
        body: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200.0,
              child: Center(
                child: _image == null
                    ? Text('Nenhuma imagem selecionada.')
                    : Image.file(_image),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: getImageFromCam,
                  tooltip: 'Carregue uma imagem',
                  child: Icon(Icons.add_a_photo),
                ),
                FloatingActionButton(

                  onPressed: getImageFromGallery,
                  tooltip: 'Carregar imagem',
                  child: Icon(Icons.wallpaper),
                ),
              ],
            ),
          ],
        )
    );
  }

}