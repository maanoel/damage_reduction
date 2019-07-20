import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'ButtonsToNavigation.dart';

class ArtigoListPage extends StatefulWidget {
  @override
  ArtigoListPageeState createState() => ArtigoListPageeState();
}

class ArtigoListPageeState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blueAccent,
          title: Text('Lista de Artigos'),
        ),
        body: null,
        bottomNavigationBar:
        ButtonsNavigatorInginer().ButtonsToNavigator(context));
  }
}
