import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'ButtonsToNavigation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/scheduler.dart';

class SubstanceListPage extends StatefulWidget {
  @override
  _SbustanceListPageState createState() => _SbustanceListPageState();
}

class _SbustanceListPageState extends State {
  List<dynamic> _substanceList = new List();

  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();
      getSubstances();
    }

    return FutureBuilder<String>(
        future: getSubstances(), // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blueAccent,
                title: Text('Substâncias'),
              ),
              body: ListView.separated(
                itemCount: _substanceList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: (){

                    },
                      leading: CircleAvatar(
                        backgroundImage: Image.memory(Base64Decoder().convert(('${_substanceList[index]['base64Image']}'))).image,
                      ),
                    title: Text('${_substanceList[index]['name']}'),
                    trailing: Icon(Icons.keyboard_arrow_right)
                  );
                },
                separatorBuilder: (context, index){
                    return Divider();
                },
              ),
              bottomNavigationBar: ButtonsNavigatorInginer()
                  .ButtonsToNavigator()); // unreachable
        });
  }

  Future<String> getSubstances() async {
    var headers = {
      "content-type": "application/json",
      "accept": "application/json",
    };

    var resp = await http.get("http://192.168.200.1:5000/api/Substance/v1",
        headers: headers);

    _substanceList = json.decode(resp.body);

  }
}
