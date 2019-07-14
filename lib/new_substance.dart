import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'menu.dart';

class NewSubstancePage extends StatefulWidget {
  @override
  NewSubstanceState createState() => NewSubstanceState();
}

class NewSubstanceState extends State<NewSubstancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueAccent, title: Text("Nova substância")),
      backgroundColor: Colors.white,
      body: Padding(
          padding: EdgeInsets.all(10),
          child: Form(child:
          Container(
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,children: <Widget>[


              ],

          )))),
    );
  }
}
