import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'ButtonsToNavigation.dart';

class PhoneListPage extends StatefulWidget {
  @override
  _PhoneceListPageState createState() => _PhoneceListPageState();
}

class _PhoneceListPageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blueAccent,
          title: Text('Telêfones de emergência'),
        ),
        body: null,
        bottomNavigationBar:
            ButtonsNavigatorInginer().ButtonsToNavigator(context));
  }
}
