import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:travel_app/extensions/extensions.dart';

import '../core/R.dart';

class CustomBackButton extends StatelessWidget {
  final Function()? onPressed;
  final String? label;
  final bool hasLabel;
  const CustomBackButton({
    Key? key,
    this.onPressed,
    this.label,
     this.hasLabel = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SvgPicture.asset(R.backArrow),
          if (hasLabel)
            (label ?? 'Back').boldTextStyle(15).padding(
                  left: 8,
                )
        ],
      ),
    );
  }
}
