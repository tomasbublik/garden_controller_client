import 'package:flutter/material.dart';
import 'package:flutter/src/services/system_navigator.dart';

class MyDrawerMenu {

  static Drawer getMenu(BuildContext context) {
    return new Drawer(
        child: new ListView(
          children: <Widget>[
            new DrawerHeader(child: new Text('Navigation menu'),),
            new ListTile(
              title: new Text('Lights controlling'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
            new ListTile(
              title: new Text('Current schedule program'),
              onTap: () {
                //Navigator.of(context).pushNamed('/a');
                Navigator.pushReplacementNamed(context, '/a');
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text('About'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/about');
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text('Animation example'),
              onTap: () {
                Navigator.of(context).pushNamed('/animation');
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text('Exit'),
              onTap: () {
                SystemNavigator.pop();
              },
            ),
          ],
        )
    );
  }

}