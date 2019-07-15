import 'package:flutter/material.dart';
import 'new_substance.dart';
import 'ButtonsToNavigation.dart';
import 'substance_list.dart';
import 'phone.dart';

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
            child: Wrap(
              children: <Widget>[
                Row(children: <Widget>[
                  Divider(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: IconTheme(
                        data: IconThemeData(color: Colors.lightBlueAccent),
                        child: IconButton(
                            icon: Icon(
                              Icons.enhanced_encryption,
                              size: 70.0,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SubstanceListPage(),
                                  ));
                            })),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 0.5, horizontal: 1.0),
                    margin: EdgeInsets.all(2.0),
                    child: Text("Substâncias"),
                  )
                ]),
                Divider(),
                Row(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: IconTheme(
                        child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SubstancePage(),
                              ));
                            },
                            tooltip: "Inserir uma substância",
                            icon: Icon(
                              Icons.note_add,
                              size: 70.0,
                            )),
                        data: IconThemeData(
                          color: Colors.lightBlueAccent,
                        )),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 0.5, horizontal: 1.0),
                    margin: EdgeInsets.all(2.0),
                    child: Text("Cadastrar substância"),
                  )
                ]),
                Divider(),
                Row(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: IconTheme(
                        child: IconButton(
                          icon: Icon(
                            Icons.phone,
                            size: 70.0,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PhoneListPage(),
                                ));
                          },
                        ),
                        data: IconThemeData(
                          color: Colors.lightBlueAccent,
                        )),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 0.5, horizontal: 1.0),
                    margin: EdgeInsets.all(2.0),
                    child: Text("Emergência"),
                  )
                ]),
                Divider(),
              ],
            ),
          )),
      bottomNavigationBar: ButtonsNavigatorInginer().ButtonsToNavigator(),
    );
  }



  BoxDecoration boxDecorationMenu() {
    return BoxDecoration(
      border: Border.all(),
      color: Colors.white70,
    );
  }
}
