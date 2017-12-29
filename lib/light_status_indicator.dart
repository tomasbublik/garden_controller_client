import 'package:flutter/material.dart';
import 'package:flutter_app/animation_page.dart';
import 'package:flutter_app/my_box_decoration.dart';

class LightStatusIndicator extends StatefulWidget {
  var lightStatusIndicatorState = new _LightStatusIndicatorState();

  @override
  _LightStatusIndicatorState createState() {
    return lightStatusIndicatorState;
  }

  toggleState() {
    lightStatusIndicatorState.toggleState();
  }
}

class _LightStatusIndicatorState extends State<LightStatusIndicator> {

  bool _enabled = false;

  bool showBorders = false;

  void _toggleState() {
    setState(() {
      if (_enabled) {
        _enabled = false;
      } else {
        _enabled = true;
      }
    });
  }

  toggleState() {
    _toggleState();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: 100.0,
      decoration: showBorders
          ? MyBoxDecoration.getGeneralBoxDecoration()
          : MyBoxDecoration.getEmptyBoxDecoration(),
      margin: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
      alignment: Alignment.topRight,
      child: new Column(
        children: <Widget>[
          new Container(
            height: 100.0,
            width: 100.0,
            decoration: showBorders
                ? MyBoxDecoration.getGeneralBoxDecoration()
                : MyBoxDecoration.getEmptyBoxDecoration(),
            child: new GestureDetector(
              onTap: _toggleState,
              child: (_enabled
                  ? /*new Align(
                  child: new Image.asset(
                      "assets/light_icon_enabled.png", scale: 0.1))*/
                  new LogoApp()
                  : new Align(
                  child: new Image.asset("assets/light_icon.png", scale: 0.1))),
            ),
          ),
        ],
      ),
    );
  }
}
