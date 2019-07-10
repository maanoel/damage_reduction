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
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Nome'
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Preencha antes de continuar';
                          }

                          return null;
                        },
                      ),
                      Divider(),
                      TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Sobrenome'
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Preencha antes de continuar';
                          }

                          return null;
                        },
                      ),
                      Divider(),
                      TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Data de Nascimento'
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Preencha antes de continuar';
                          }

                          return null;
                        },
                      ),
                      Divider(),
                      TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'E-mail'
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Preencha antes de continuar';
                          }

                          return null;
                        },
                      ),
                      Divider(),
                      TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Senha'
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Preencha antes de continuar';
                          }

                          return null;
                        },
                      ),
                      Divider(),
                      TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Confirme a senha'
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Preencha antes de continuar';
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
                              Scaffold.of(context).showSnackBar(
                                  SnackBar(content: Text('Processing Data')));
                            }
                          },
                          child: Text('Cadastrar'),
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}
