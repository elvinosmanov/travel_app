import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:travel_app/core/colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
    this.margin,
    this.color,
  }) : super(key: key);
  final EdgeInsets? margin;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: double.infinity,
      height: 1,
      color: color ?? kDarkGreyColor,
    );
  }
}
