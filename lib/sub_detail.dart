import 'package:flutter/material.dart';
import 'dart:io';

class SubstanceDetailPage extends StatefulWidget {
  @override
  _SbustanceDetailPageState createState() => _SbustanceDetailPageState();

  int id;

  SubstanceDetailPage({Key key, @required this.id}) : super(key: key);
}

class _SbustanceDetailPageState extends State {
  File _image;
  List<dynamic> _comentsLits;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: populate(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blueAccent,
                title: Text('Cahaça'),
              ),
              body: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text("Cachaça",
                              style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              )),
                          Divider(),
                          Text("Alcool",
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
                          child: _image == null
                              ? Text('Problema ao carregar a imagem.')
                              : Image.file(_image),
                        ),
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
                      Container(
                        child: ListView.separated(
                          itemBuilder: (context, index) {},
                          //itemCount: _comentsLits.length,
                        ),
                      )
                    ],
                  )));
        });
  }

  Future<String> populate() async {}
}
