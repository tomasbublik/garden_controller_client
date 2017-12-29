import 'package:flutter/material.dart';
import 'package:flutter_app/drawer_menu.dart';

class AboutPage extends StatefulWidget {

  @override
  _AboutPageState createState() => new _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('This is super cool menu page'),
      ),
      drawer: MyDrawerMenu.getMenu(context),
      body: new Center(
/*
        child: new FlatButton(
          child: new Text('Back'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
*/
      ),
    );
  }
}