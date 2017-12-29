import 'package:flutter/material.dart';

class MyBoxDecoration {
  static BoxDecoration getEmptyBoxDecoration() {
    return new BoxDecoration(
      border: new Border.all(width: 0.0, color: Colors.transparent),
    );
  }

  static BoxDecoration getGeneralBoxDecoration() {
    return new BoxDecoration(
      border: new Border.all(width: 2.0, color: Colors.black),
    );
  }
}