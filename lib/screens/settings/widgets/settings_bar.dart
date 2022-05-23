import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:travel_app/core/cores.dart';
import 'package:travel_app/extensions/extensions.dart';

class SettingsBar extends StatelessWidget {
  const SettingsBar({
    Key? key,
    required this.title,
    this.onPressed,
    this.flagIconName,
    this.color,
    this.hasSelected = true,
    this.hasIcon = true,
  }) : super(key: key);
  final String title;
  final void Function()? onPressed;
  final String? flagIconName;
  final Color? color;
  final bool hasSelected;
  final bool hasIcon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.only(left: 16, right: flagIconName != null ? 16 : 7, bottom: 15, top: 15),
        decoration: BoxDecoration(
          color: hasSelected ? kWhiteColor : kLightGreyColor_1,
          border: Border(
            bottom: BorderSide(
              color: Colors.black.withOpacity(0.1),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            title.regularTextStyle(15, color),
            flagIconName != null
                ? Container(
                    width: 26,
                    height: 26,
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: SvgPicture.asset(flagIconName!),
                  )
                : hasIcon
                    ? SvgPicture.asset(R.rightArrow)
                    : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
