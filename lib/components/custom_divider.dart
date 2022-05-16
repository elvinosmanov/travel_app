import 'package:flutter/cupertino.dart';
import 'package:travel_app/core/colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 0.5,
      color: kDarkGreyColor,
    );
  }
}
