import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/drawer_menu.dart';

const DEFAULT_VALUE = "unknown\n";
const URL_ADDRESS = 'http://192.168.1.6:3000/scheduler';
const EVENING_TURN_ON_TIME = 'Evening turn on time: ';
const EVENING_TURN_OFF_TIME = 'Evening turn off time: ';
const MORNING_TURN_ON_TIME = 'Morning turn on time: ';
const MORNING_TURN_OFF_TIME = 'Morning turn off time: ';
const DATE_LENGTH = 20;
const SEPARATOR = ': ';

class SchedulerInfoPage extends StatefulWidget {
  SchedulerInfoPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SchedulerInfoPageState createState() => new _SchedulerInfoPageState();
}

class _SchedulerInfoPageState extends State<SchedulerInfoPage> {
  String _rESTEndpointContent = DEFAULT_VALUE;
  String _extractedText = "";
  bool _indicationEnabled = false;

  _getSchedulerRESTContent() async {
    setState(() {
      _indicationEnabled = true;
    });
    String url = URL_ADDRESS;
    var httpClient = createHttpClient();
    var response = await httpClient.read(url);

    setState(() {
      _rESTEndpointContent = response;
      try {
        _extractedText = extractData(response);
      } catch (e) {
        print(e);
      }
      _indicationEnabled = false;
    });
  }

  List<Widget> buildListOfLines(String lines) {
    if (lines == DEFAULT_VALUE) {
      return new List<Widget>();
    }
    return lines.split('\n').map((line) => new Text(line)).toList();
  }

  String extractData(String lines) {
    var result = new StringBuffer();
    if (lines == DEFAULT_VALUE) {
      return 'Data empty';
    }

    if (lines.contains(EVENING_TURN_ON_TIME)
        && lines.contains(EVENING_TURN_OFF_TIME)
        && lines.contains(MORNING_TURN_ON_TIME)
        && lines.contains(MORNING_TURN_OFF_TIME)
    ) {
      var eveOnIndex = lines.indexOf(EVENING_TURN_ON_TIME) +
          EVENING_TURN_ON_TIME.length;
      var eveOffIndex = lines.indexOf(EVENING_TURN_OFF_TIME) +
          EVENING_TURN_OFF_TIME.length;
      var mrnOnIndex = lines.indexOf(MORNING_TURN_ON_TIME) +
          MORNING_TURN_ON_TIME.length;
      var mrnOffIndex = lines.indexOf(MORNING_TURN_OFF_TIME) +
          MORNING_TURN_OFF_TIME.length;
      result.writeAll([
        EVENING_TURN_ON_TIME +
            lines.substring(eveOnIndex, eveOnIndex + DATE_LENGTH),
        EVENING_TURN_OFF_TIME +
            lines.substring(eveOffIndex, eveOffIndex + DATE_LENGTH),
        MORNING_TURN_ON_TIME +
            lines.substring(mrnOnIndex, mrnOnIndex + DATE_LENGTH),
        MORNING_TURN_OFF_TIME +
            lines.substring(mrnOffIndex, mrnOffIndex + DATE_LENGTH)
      ], '\n');
    }
    return result.toString();
  }

  Widget setCircularProgressIndicator(bool visible) {
    Widget circularProgressIndicator = visible
        ? new CircularProgressIndicator()
        : new Container(width: 1.0, height: 1.0,);
    return circularProgressIndicator;
  }

  @override
  Widget build(BuildContext context) {
    var spacer = new SizedBox(height: 32.0);

    return new Scaffold(
      appBar: new AppBar(title: new Text(widget.title)),
      drawer: MyDrawerMenu.getMenu(context),
      body: new Center(
        child: new Container(
          child: new Column(
              children: [
                spacer,
                new Text(
                  'Page content: ',
                ),
                setCircularProgressIndicator(_indicationEnabled),
                new Container(
                  height: 250.0,
                  child: new ListView(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(20.0),
                      children: buildListOfLines(_rESTEndpointContent)
                  ),
                ),
                spacer,
                new RaisedButton(
                  onPressed: _getSchedulerRESTContent,
                  child: new Text('Download content'),
                ),
                spacer,
                new Container(
                  height: 100.0,
                  child: new ListView(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(20.0),
                      children: buildListOfLines(_extractedText)
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }
}