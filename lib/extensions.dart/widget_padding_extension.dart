
import 'package:flutter/material.dart';

extension WidgetPadding on Widget {
  Padding padding({double top = 0.0, double bottom = 0.0, double left = 0.0, double right = 0.0}) {
    return Padding(
      padding: EdgeInsets.only(top: top, left: left, right: right, bottom: bottom),
      child: this,
    );
  }
}