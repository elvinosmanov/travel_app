import 'package:flutter/material.dart';

import 'package:travel_app/core/colors.dart';
import 'package:travel_app/extensions/extensions.dart';

class CategoryBar extends StatelessWidget {
  const CategoryBar({
    Key? key,
    required this.categoryName,
    this.onPressed,
    this.color,
  }) : super(key: key);
  final String categoryName;
  final Function()? onPressed;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          categoryName.semiBoldTextStyle(24),
          InkWell(
              onTap: onPressed,
              splashColor: kLightGreyColor_1,
              borderRadius: BorderRadius.circular(4),
              child: 'See all'.semiBoldTextStyle(15, color ?? kDarkGreyColor).padding(all: 4)),
        ],
      ),
    );
  }
}
