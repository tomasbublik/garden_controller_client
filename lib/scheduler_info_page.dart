import 'package:flutter/material.dart';
import 'package:flutter_app/drawer_menu.dart';


class SchedulerInfoPage extends StatefulWidget {
  SchedulerInfoPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SchedulerInfoPageState createState() => new _SchedulerInfoPageState();
}

class _SchedulerInfoPageState extends State<SchedulerInfoPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(widget.title)),
      drawer: MyDrawerMenu.getMenu(context),
      body: new Center(
/*        child: new FlatButton(
          child: new Text('Back'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )*/
      ),
    );
  }
}