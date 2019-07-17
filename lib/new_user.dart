import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'menu.dart';

class NewUserPage extends StatefulWidget {
  @override
  NewUserPageState createState() => NewUserPageState();
}

class NewUserPageState extends State<NewUserPage> {
  final _formKey = GlobalKey<FormState>();
  final _login = TextEditingController();
  final _accessKey = TextEditingController();

  final _name = TextEditingController();
  final _lastName = TextEditingController();
  final _birthDay = TextEditingController();
  final _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blueAccent, title: Text("Novo usuário")),
        backgroundColor: Colors.white,
        body: Padding(
            padding: EdgeInsets.all(10),
            child: Form(
                key: _formKey,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TextFormField(
                        controller: _login,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Login'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Preencha o login antes de continuar';
                          }

                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _name,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Nome'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Preencha o nome antes de continuar';
                          }

                          return null;
                        },
                      ),
                      Divider(),
                      TextFormField(
                        controller: _lastName,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Sobrenome'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Preencha o Sobrenome antes de continuar';
                          }

                          return null;
                        },
                      ),
                      Divider(),
                      TextFormField(
                        controller: _birthDay,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Data de Nascimento'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Preencha a data de nascimento antes de continuar';
                          }

                          return null;
                        },
                      ),
                      Divider(),
                      TextFormField(
                        controller: _email,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'E-mail'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Preencha o e-mail antes de continuar';
                          }

                          return null;
                        },
                      ),
                      Divider(),
                      TextFormField(
                        controller: _accessKey,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Senha'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Preencha a senha antes de continuar';
                          }

                          return null;
                        },
                      ),
                      Divider(),
                      TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Confirme a senha'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Confirme a senha antes de continuar';
                          }

                          return null;
                        },
                      ),
                      ButtonTheme(
                        height: 40,
                        child: RaisedButton(
                          color: Colors.white70,
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              newUser();
                            }
                          },
                          child: Text('Cadastrar'),
                        ),
                      ),
                    ],
                  ),
                ))));
  }

  void newUser() async {

    String login = _login.text;
    String accessKey = _accessKey.text;
    String name = _name.text;
    String lastName = _lastName.text;
    String birthDay = '2019-01-01';
    String email = _email.text;

    var headers = {
      "content-type": "application/json",
      "accept": "application/json",
    };

    String data =
        '{"login": "$login", "accessKey": "$accessKey", "name": "$name", '
        '"lastName": "$lastName", "birthday": "$birthDay", "email": "$email"}';

    var resp = await http.post("http://192.168.200.1:5000/api/User/v1",
        body: data, headers: headers);

    final body = jsonDecode(resp.body);

    if (resp.statusCode == 200) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Menu()));
    }else{

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Ops..."),
            content: Text("Verifique verifique os dados e tente novamente."),
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
