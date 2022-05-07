import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:travel_app/core/R.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({
    Key? key,
    required this.onPressed,
    required this.value,
  }) : super(key: key);
  final Function() onPressed;
  final bool value;
  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPressed();
      },
      child: SvgPicture.asset(widget.value ? R.check : R.uncheck),
    );
  }
}
