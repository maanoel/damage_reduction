import 'package:flutter/material.dart';
import 'dart:io';
import 'menu.dart';
import 'perfil.dart';

import 'new_substance.dart';

class ButtonsNavigatorInginer {
  int currentIndex = 0;

  BottomNavigationBar ButtonsToNavigator(BuildContext context) {
    return BottomNavigationBar(
      onTap: (int id) {
        if (id == 0) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Menu(),
              ));
        }

        if (id == 1) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PerfilPage(),
              ));
        }

        if (id == 2) {
          exit(0);
        }
      },
      currentIndex: currentIndex, // this will be set when a new tab is tapped
      items: [
        BottomNavigationBarItem(
          backgroundColor: Colors.blue,
          icon: new Icon(Icons.home),
          title: new Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.account_box),
          title: new Text('Meu Perfil'),
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Sair'))
      ],
    );
  }
}
