import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Padding(
          padding: EdgeInsets.all(10.0),
          child:
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.directions_bike, size: 140.0, color: Colors.white,),
                  Center(
                     // padding: EdgeInsets.all(10.0),
                      child: Text('Good Trip', style: TextStyle(color: Colors.white, fontSize: 30.0))
                  ),
                  Divider(),
                  TextFormField(
                    autofocus: true,
                    //keyboardType: TextInputType.number,
                    style : new TextStyle(color: Colors.white, fontSize: 30.0),
                    decoration: InputDecoration(
                      labelText: "Login",
                      labelStyle: TextStyle(
                        color: Colors.white
                      )
                    ),
                  ),
                  Divider(

                  ),
                  TextFormField(
                    obscureText: true,
                    autofocus: true,
                    //keyboardType: TextInputType.number,
                    style : new TextStyle(color: Colors.white, fontSize: 30.0),
                    decoration: InputDecoration(
                        labelText: "Senha",
                        labelStyle: TextStyle(
                            color: Colors.white
                        )
                    ),
                  ),
                  Divider(),
                  ButtonTheme(
                    height: 80.0,
                    child: RaisedButton(
                        color: Colors.white,
                        onPressed: () => {},
                        child: Text('Entrar',
                            style: TextStyle(color: Colors.blueAccent)),
                    )
                  )
                ],
              ),
            )),
    );
  }

}
