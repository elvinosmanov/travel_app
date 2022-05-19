import 'package:flutter/cupertino.dart';

import 'package:travel_app/core/colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
    this.margin,
  }) : super(key: key);
  final EdgeInsets? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: double.infinity,
      height: 0.5,
      color: kDarkGreyColor,
    );
  }
}
