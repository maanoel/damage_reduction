import 'package:flutter/material.dart';
import 'new_substance.dart';

class ButtonsNavigatorInginer {

  BottomNavigationBar ButtonsToNavigator() {
    return BottomNavigationBar(
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
    );
  }
}
