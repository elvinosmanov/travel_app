
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
  ///fontsize, color
  ///| default black color
  Text boldTextStyle(double fontSize, [Color? color]) {
    return Text(
      this ?? '',
      style: kBoldTextStyle(fontSize, color),
    );
  }
  
}
