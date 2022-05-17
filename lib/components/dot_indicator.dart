import 'package:flutter/material.dart';

import 'package:travel_app/core/colors.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    this.isActive = false,
    this.deActiveColor,
    this.deActiveBorder,
  }) : super(key: key);
  final bool isActive;
  final Color? deActiveColor;
  final Border? deActiveBorder;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: 16,
      height: 16,
      decoration: isActive
          ? const BoxDecoration(shape: BoxShape.circle, color: kBlueColor)
          : BoxDecoration(
              shape: BoxShape.circle,
              color: deActiveColor,
              border: deActiveBorder ?? Border.all(color: kWhiteColor, width: 1)),
    );
  }
}
