import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'substance_list.dart';

class SubstancePage extends StatefulWidget {
  @override
  _SbustancePageState createState() => _SbustancePageState();
}

class _SbustancePageState extends State {
  File _image;
  final _name = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _nameScientific = TextEditingController();
  final _description = TextEditingController();
  final _composto = TextEditingController();

  Future getImageFromCam() async {
    // for camera
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  Future getImageFromGallery() async {
    // for gallery
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blueAccent,
          title: Text('Nova substância'),
        ),
        body: ListView(
          children: [
            Divider(),
            Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200.0,
                  child: Center(
                    child: _image == null
                        ? Text('Nenhuma imagem de substância selecionada.')
                        : Image.file(_image),
                  ),
                )
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    child: FloatingActionButton(
                        backgroundColor: Colors.blueAccent,
                        heroTag: null,
                        onPressed: getImageFromCam,
                        tooltip: 'Carregue uma imagem',
                        child: IconTheme(
                          data: IconThemeData(color: Colors.white),
                          child: Icon(Icons.add_a_photo),
                        ))),
                Container(
                    child: FloatingActionButton(
                  backgroundColor: Colors.blueAccent,
                  heroTag: null,
                  onPressed: getImageFromGallery,
                  tooltip: 'Carregar imagem',
                  child: Icon(Icons.wallpaper),
                )),
              ],
            ),
            Divider(),
            Form(
              key: _formKey,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      controller: _name,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Nome comum da substância'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Preencha o nome comum da substância antes de continuar';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _nameScientific,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Nome científico da substância'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Preencha o nome científico da substância antes de continuar';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _composto,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Composto da substância'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Preencha o composto da substância antes de continuar';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _description,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Descrição da substância'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Preencha o nome da substância antes de continuar';
                        }
                        return null;
                      },
                    ),
                    ButtonTheme(
                      height: 40,
                      child: RaisedButton(
                        color: Colors.white70,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            newSubstance();
                          }
                        },
                        child: Text('Cadastrar'),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }

  newSubstance() async {

    String name = _name.text;
    String nameScientific = _nameScientific.text;
    String description = _description.text;
    String composto = _composto.text;

    var headers = {
      "content-type": "application/json",
      "accept": "application/json",
    };

    List<int> imageBytes = _image.readAsBytesSync();
    String imageBase64 = base64Encode(imageBytes);

    String data =
        '{"name": "$name", "nameScientific": "$nameScientific", "description": "$description", '
        '"composto": "$composto", "dataRegistro": "2019-07-16T02:51:22.738Z", "base64Image": "$imageBase64"}';

    Dio dio = new Dio();
    dio.options.contentType = ContentType.parse("application/json");

    Response response = await dio.post("http://192.168.200.1:5000/api/Substance/v1", data: data);

    if(response.statusCode == 200){
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Substancia Cadastrada"),
            content: Text("A Substância foi cadastrada!."),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SubstanceListPage()),
                  );
                },
              )
            ],
          );
        },
      );
    }

  }
}
