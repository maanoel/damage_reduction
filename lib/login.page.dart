import 'package:flutter/material.dart';

import 'drugs.list.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.directions_bike,
                  size: 140.0,
                  color: Colors.white,
                ),
                Center(
                    // padding: EdgeInsets.all(10.0),
                    child: Text('Good Trip',
                        style: TextStyle(color: Colors.white, fontSize: 30.0))),
                Divider(),
                TextFormField(
                  controller: _userNameController,
                  autofocus: true,
                  //keyboardType: TextInputType.number,
                  style: new TextStyle(color: Colors.white, fontSize: 30.0),
                  decoration: InputDecoration(
                      labelText: "Login",
                      labelStyle: TextStyle(color: Colors.white)),
                ),
                Divider(),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  autofocus: true,
                  //keyboardType: TextInputType.number,
                  style: new TextStyle(color: Colors.white, fontSize: 30.0),
                  decoration: InputDecoration(
                      labelText: "Senha",
                      labelStyle: TextStyle(color: Colors.white)),
                ),
                Divider(),
                ButtonTheme(
                    height: 80.0,
                    child: RaisedButton(
                      color: Colors.white,
                      onPressed: () => {
                            if (canLogin())
                              {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DrugsListPage()),
                                )
                              }
                            else
                              {
                                // set up the button
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Ops..."),
                                      content: Text(
                                          "Verifique seu login ou sua senha."),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text("OK"),
                                          onPressed: () {},
                                        )
                                      ],
                                    );
                                  },
                                )
                              }
                          },
                      child: Text('Entrar',
                          style: TextStyle(color: Colors.blueAccent)),
                    ))
              ],
            ),
          )),
    );
  }

  canLogin() {

  }

}
