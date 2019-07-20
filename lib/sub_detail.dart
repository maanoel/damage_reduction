import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';

class Substance {
  int id;
  String name;
  String name_scie;
  String descricao;
  String composto;
  DateTime dt_reg;
  Uint8List photo;


  Substance() {}

  Substance.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        name_scie = json['nameScientific'],
        composto = json['composto'],
        descricao = json['description'],
        dt_reg = DateTime.parse(json['dataRegistro']),
        photo = base64Decode(json['base64Image']);

  // method
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'name_scie': name_scie,
      'descricao': descricao,
      'composto': composto,
      'dt_reg': dt_reg,
      'photo': json.encode(photo)
    };
  }
}

class SubstanceDetailPage extends StatefulWidget {
  int id;

  SubstanceDetailPage({Key key, @required this.id}) : super(key: key);

  @override
  _SbustanceDetailPageState createState() => _SbustanceDetailPageState(id);
}

class _SbustanceDetailPageState extends State {
  List<dynamic> _comentsLits = new List();
  File _image;
  int id = 0;

  Substance _substance;

  _SbustanceDetailPageState(int id) {
    this.id = id;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: populateSub(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blueAccent,
                title: Text(_substance.name),
              ),
              body: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(_substance.name_scie,
                              style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.black45,
                              )),
                        ],
                      ),
                      Divider(),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200.0,
                        child: Center(
                            child: _substance.photo == null
                                ? Text('Problema ao carregar a imagem.')
                                : Center(
                                    child: Image.memory(_substance.photo))),
                      ),
                      Divider(),
                      Container(
                        child: Container(
                            padding: EdgeInsets.all(10),
                            child: Center(
                              child: Row(
                                children: <Widget>[
                                  IconTheme(
                                      data:
                                          IconThemeData(color: Colors.blueGrey),
                                      child: IconButton(
                                          icon: Icon(
                                            Icons.directions_bike,
                                            size: 30.0,
                                          ),
                                          onPressed: () {})),
                                  IconTheme(
                                      data:
                                          IconThemeData(color: Colors.blueGrey),
                                      child: IconButton(
                                          icon: Icon(
                                            Icons.mood_bad,
                                            size: 30.0,
                                          ),
                                          onPressed: () {})),
                                  IconTheme(
                                    data: IconThemeData(color: Colors.blueGrey),
                                    child: IconButton(
                                        icon: Icon(
                                          Icons.local_hospital,
                                          size: 30.0,
                                        ),
                                        onPressed: () {}),
                                  ),
                                  Text("Outras informações",
                                      style: TextStyle(
                                        color: Colors.blueGrey,
                                      )),
                                ],
                              ),
                            )),
                      ),
                      Divider(),
                      /*
                      TODO POPULATE COMMAND
                      Container(
                        child: ListView.separated(
                          itemBuilder: (context, index) {},
                          itemCount: 0,
                        ),
                      )
                      */
                    ],
                  )));
        });
  }

  Future<String> populateSub() async {
    var headers = {
      "content-type": "application/json",
      "accept": "application/json",
    };

    var resp = await http.get(
        "http://192.168.200.1:5000/api/Substance/v1/" + id.toString(),
        headers: headers);

    Map<String, dynamic> map = jsonDecode(resp.body);
    _substance = Substance.fromJson(map);
  }

  Future<String> populateComments() async {
    var headers = {
      "content-type": "application/json",
      "accept": "application/json",
    };

    var resp = await http.get("http://192.168.200.1:5000/api/Substance/v1/",
        headers: headers);

    _comentsLits = json.decode(resp.body);
  }
}
