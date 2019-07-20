import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'ButtonsToNavigation.dart';

class ArtigoPage extends StatefulWidget {
  @override
  ArtigoPageeState createState() => ArtigoPageeState();
}

class ArtigoPageeState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blueAccent,
          title: Text('Artigos'),
        ),
        body: null,
        bottomNavigationBar:
            ButtonsNavigatorInginer().ButtonsToNavigator(context));
  }
}
