import 'package:flutter/material.dart';
import 'package:travel_app/core/colors.dart';
import 'package:travel_app/extensions.dart/extensions.dart';

class TextBetweenLine extends StatelessWidget {
  const TextBetweenLine({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildLine(),
        text.mediumTextStyle(14, kLightGreyColor_5).padding(left: 13, right: 13),
        _buildLine(),
      ],
    );
  }

  Container _buildLine() {
    return Container(
      width: 50,
      height: 1,
      color: kLightGreyColor_5,
    );
  }
}
