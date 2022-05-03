import 'package:flutter/material.dart';
import 'package:travel_app/core/styles.dart';

extension TextModifierStyle on String? {
  Text heading1([Color? color]) {
    return Text(
      this ?? '',
      style: kHeading_1(color),
    );
  }

  Text heading2([Color? color]) {
    return Text(
      this ?? '',
      style: kHeading_2(color),
    );
  }

  Text regularTextStyle(double fontSize, [Color? color]) {
    return Text(
      this ?? '',
      style: kRegularTextStyle(fontSize, color),
    );
  }

  Text mediumTextStyle(
    double fontSize, [
    Color? color,
  ]) {
    return Text(
      this ?? '',
      style: kMediumTextStyle(fontSize, color),
    );
  }

  Text semiBoldTextStyle(double fontSize, [Color? color]) {
    return Text(
      this ?? '',
      style: kSemiBoldTextStyle(fontSize, color),
    );
  }

  Text boldTextStyle(double fontSize, [Color? color]) {
    return Text(
      this ?? '',
      style: kRegularTextStyle(fontSize, color),
    );
  }
}

extension WidgetPadding on Widget {
  Padding padding({double top = 0.0, double bottom = 0.0, double left = 0.0, double right = 0.0}) {
    return Padding(
      padding: EdgeInsets.only(top: top, left: left, right: right, bottom: bottom),
      child: this,
    );
  }
}

extension CopyWithToText on Text {
  Text copyWith(TextStyle textStyle) {
    return Text(
      data ?? '',
      style: style == null ? const TextStyle() : style!.merge(textStyle),
    );
  }
}
