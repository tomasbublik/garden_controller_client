import 'package:flutter/material.dart';
import 'package:flutter_app/animation_page.dart';
import 'package:flutter_app/drawer_menu.dart';
import 'package:flutter_app/light_status_indicator.dart';
import 'package:flutter_app/my_box_decoration.dart';
import 'package:flutter_app/scheduler_info_page.dart';
import 'package:flutter_app/about_page.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: new MyHomePage(title: 'Garden lights home'),
      routes: <String, WidgetBuilder>{
        '/scheduler': (BuildContext context) =>
        new SchedulerInfoPage(title: 'Scheduler info'),
        '/settings': (BuildContext context) => new SchedulerInfoPage(title: 'Future settings page'),
        '/about': (BuildContext context) => new AboutPage(),
        '/animation': (BuildContext context) => new LogoApp(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool showBorders = false;
  var lightStatusIndicator = new LightStatusIndicator();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var leftColumn = new Container(
      padding: new EdgeInsets.fromLTRB(20.0, 30.0, 0.0, 20.0),
      decoration: showBorders
          ? MyBoxDecoration.getGeneralBoxDecoration()
          : MyBoxDecoration.getEmptyBoxDecoration(),
      child: new Column(
        children: [
          new RaisedButton(
              onPressed: lightStatusIndicator.toggleState,
              child: const Text('Turn on the lights'),
              color: Colors.lightGreen),
          new Text(
            'Attempt: $_counter',
            style: Theme
                .of(context)
                .textTheme
                .display1,
          ),
          new RaisedButton(
              onPressed: _incrementCounter,
              child: const Text('Scan for RPI'),
              color: Colors.lightGreen)
        ],
      ),
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      drawer: MyDrawerMenu.getMenu(context),
      body: new Center(
        child: new Container(
          decoration: showBorders
              ? MyBoxDecoration.getGeneralBoxDecoration()
              : MyBoxDecoration.getEmptyBoxDecoration(),
          margin: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          child: new Card(
              child: new Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Expanded(child: new Container(
                    alignment: Alignment.centerLeft,
                    decoration: showBorders ? MyBoxDecoration
                        .getGeneralBoxDecoration() : MyBoxDecoration
                        .getEmptyBoxDecoration(),
                    width: 190.0,
                    child: leftColumn,
                  )),
                  new Container(
                    decoration: showBorders ? MyBoxDecoration
                        .getGeneralBoxDecoration() : MyBoxDecoration
                        .getEmptyBoxDecoration(),
                    margin: new EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  ),
                  lightStatusIndicator,
                ],
              )
          ),
        ),
      ),
    );
  }
}
