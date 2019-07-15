import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

class SubstanceListPage extends StatefulWidget {
  @override
  _SbustanceListPageState createState() => _SbustanceListPageState();
}

class _SbustanceListPageState extends State {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text('Substâncias'),
        ),
        body: null);
  }
}
