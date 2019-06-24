import 'package:flutter/material.dart';

class DrugsListPage extends StatefulWidget {
  @override
  _DrugsListPageState createState() => _DrugsListPageState();
}

class _DrugsListPageState extends State<DrugsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueAccent,title: Text("Good Trip")),
      backgroundColor: Colors.white,
      body: Text("Hello world"),
    );
  }
}
