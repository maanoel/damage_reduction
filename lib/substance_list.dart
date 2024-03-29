import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'ButtonsToNavigation.dart';
import 'package:http/http.dart' as http;
import 'sub_detail.dart';
import 'dart:convert';
import 'package:flutter/scheduler.dart';
import 'config.dart';

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
    }

    return FutureBuilder<String>(
        future: getSubstances(), // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.blueAccent,
                title: Text('Substâncias'),
              ),
              body: ListView.separated(
                itemCount: _substanceList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SubstanceDetailPage(id: _substanceList[index]['id'])),
                      );
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
                  .ButtonsToNavigator(context)); // unreachable
        });
  }

  Future<String> getSubstances() async {
    var headers = {
      "content-type": "application/json",
      "accept": "application/json",
    };

    var resp = await http.get(GLOBAL_VARIABLES['API_URL'] + "/Substance/v1/",
        headers: headers);

    _substanceList = json.decode(resp.body);

  }
}
