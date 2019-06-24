import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'menu.dart';

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
                      onPressed: ()  =>  {
                             tryLogin(),
                          },
                      child: Text('Entrar',
                          style: TextStyle(color: Colors.blueAccent)),
                    ))
              ],
            ),
          )),
    );
  }

  void tryLogin () async {

    String login = _userNameController.text;
    String senha = _passwordController.text;
    bool userCanLogin = false;

    var headers = {
      "content-type" : "application/json",
    "accept" : "application/json",
    };

   String data = '{"login": "$login", "accessKey": "$senha"}';

    //parametrizar a url da api
   var  resp = await http.post("http://192.168.200.1:5000/api/Login/v1",body: data, headers: headers);

   final body = jsonDecode(resp.body);

   print(body["autenticated"] );

    if(body["autenticated"] == true){
      userCanLogin = true;
    }

    if (userCanLogin)
      {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Menu()),
      );
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
      );
    }
  }

}
