import 'package:flutter/material.dart';
import 'package:travel_app/core/colors.dart';

const String gilroyFontFamily = "Gilroy";

///Default Black color setted
///fontsize: 32
TextStyle kHeading_1([Color? color]) {
  return TextStyle(
    fontFamily: gilroyFontFamily,
    color: color ?? kBlackColor,
    fontSize: 32,
    height: 0.97,
    fontWeight: FontWeight.w600,
  );
}

///Default black color setted
///fontsize: 24
TextStyle kHeading_2([Color? color]) {
  return TextStyle(
    fontFamily: gilroyFontFamily,
    color: color ?? kBlackColor,
    fontSize: 24,
    height: 0.97,
    fontWeight: FontWeight.w600,
  );
}

///Default black color setted
TextStyle kBoldTextStyle(double fontSize, [Color? color]) {
  return TextStyle(
    fontFamily: gilroyFontFamily,
    color: color ?? kBlackColor,
    fontSize: fontSize,
    fontWeight: FontWeight.w700,
  );
}

///Default black color setted
TextStyle kSemiBoldTextStyle(double fontSize, [Color? color]) {
  return TextStyle(
    fontFamily: gilroyFontFamily,
    color: color ?? kBlackColor,
    fontSize: fontSize,
    fontWeight: FontWeight.w600,
  );
}

///Default black color setted
TextStyle kMediumTextStyle(double fontSize, [Color? color]) {
  return TextStyle(
    fontFamily: gilroyFontFamily,
    color: color ?? kBlackColor,
    fontSize: fontSize,
    fontWeight: FontWeight.w500,
  );
}

TextStyle kRegularTextStyle(double fontSize, [Color? color]) {
  return TextStyle(
    fontFamily: gilroyFontFamily,
    color: color ?? kBlackColor,
    fontSize: fontSize,
    fontWeight: FontWeight.w400,
  );
}

final BorderRadius kRadius16 = BorderRadius.circular(16);
final BorderRadius kRadius25 = BorderRadius.circular(25);
