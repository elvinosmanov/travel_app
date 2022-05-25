import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:travel_app/components/custom_divider.dart';
import 'package:travel_app/core/cores.dart';
import 'package:travel_app/extensions/extensions.dart';

class CustomModalBottomSheet extends StatelessWidget {
  const CustomModalBottomSheet({
    Key? key,
    required this.title,
    this.deleteOnPressed,
    this.galleryOnPressed,
    this.cameraOnPressed,
  }) : super(key: key);
  final String title;
  final VoidCallback? deleteOnPressed;
  final VoidCallback? galleryOnPressed;
  final VoidCallback? cameraOnPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: 4,
          width: 60,
          margin: const EdgeInsets.only(top: 12),
          decoration: BoxDecoration(
            borderRadius: kRadius16,
            color: kDarkGreyColor,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            title.semiBoldTextStyle(18),
            IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                splashRadius: 20,
                onPressed: () {},
                icon: SvgPicture.asset(R.delete))
          ],
        ).padding(left: 32, right: 32, bottom: 4, top: 8),
        CustomDivider(color: Colors.black.withOpacity(0.1)),
        Container(
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: kLightGreyColor_1, borderRadius: BorderRadius.circular(16)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              GestureDetector(
                onTap: galleryOnPressed,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>['Add from Photo Library'.mediumTextStyle(14), SvgPicture.asset(R.image)],
                ).padding(all: 16),
              ),
              CustomDivider(color: Colors.black.withOpacity(0.1)),
              GestureDetector(
                onTap: cameraOnPressed,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>['Take a photo'.mediumTextStyle(14), SvgPicture.asset(R.camera)],
                ).padding(all: 16),
              ),
            ],
          ),
        )
      ],
    );
  }
}
