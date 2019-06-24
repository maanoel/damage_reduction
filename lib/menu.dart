import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.blueAccent, title: Text("Good Trip")),
      backgroundColor: Colors.white,
      body: Container(
          padding: EdgeInsets.only(bottom: 20.0),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 2.0),
            child: Row(
              children: <Widget>[
                Row(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Icon(
                      Icons.exit_to_app,
                      size: 70.0,
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 0.5, horizontal: 1.0),
                    margin: EdgeInsets.all(2.0),
                    child: Text("Teste"),
                  )
                ]),
                Row(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Icon(
                      Icons.exit_to_app,
                      size: 70.0,
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Container(
                    padding:
                    EdgeInsets.symmetric(vertical: 0.5, horizontal: 1.0),
                    margin: EdgeInsets.all(2.0),
                    child: Text("Teste"),
                  )
                ])
              ],
            ),
          )),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.account_box),
            title: new Text('Meu Perfil'),
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Sair'))
        ],
      ),
    );
  }

  BoxDecoration boxDecorationMenu() {
    return BoxDecoration(
      border: Border.all(),
      color: Colors.white70,
    );
  }
}
