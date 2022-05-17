import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/core/cores.dart';

class CustomOpacityButton extends StatelessWidget {
  const CustomOpacityButton({
    Key? key,
    required this.imageName,
    this.width,
    this.height,
    this.opacity,
    this.onPressed,
  }) : super(key: key);
  final String imageName;
  final double? width;
  final double? height;
  final double? opacity;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width ?? 44,
        height: height ?? 44,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: kWhiteColor.withOpacity(opacity ?? 0.9),
            boxShadow: [kBlackBoxShadow]),
        child: SvgPicture.asset(
          imageName,
          color: kBlackColor,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
