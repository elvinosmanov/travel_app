import 'package:flutter/material.dart';
import 'package:travel_app/components/custom_divider.dart';
import 'package:travel_app/components/custom_rating_bar.dart';

import 'package:travel_app/core/cores.dart';
import 'package:travel_app/extensions/extensions.dart';

class CustomComment extends StatelessWidget {
  const CustomComment({
    Key? key,
    required this.imageName,
    required this.rating,
    required this.time,
    required this.name,
    required this.surname,
    this.comment,
  }) : super(key: key);
  final String imageName;
  final double rating;
  final String time;
  final String name;
  final String surname;
  final String? comment;
  final double circleAvatarRadius = 26;
  final double padding = 16;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              radius: circleAvatarRadius,
              backgroundImage: AssetImage(imageName),
            ).padding(right: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>['$name $surname'.semiBoldTextStyle(15), CustomRatingBar(initialRating: rating)],
            ),
            const Spacer(),
            //TODO Convert time to correct format
            Text(
              time,
              textAlign: TextAlign.end,
              style: kMediumTextStyle(11, kDarkGreyColor),
            )
          ],
        ).padding(left: padding, right: padding),
        const SizedBox(height: 12),
        if (comment != null)
          Text(
            comment!,
            textAlign: TextAlign.start,
            style: kRegularTextStyle(14),
          ).padding(left: (padding + 12) + circleAvatarRadius * 2, bottom: padding, right: padding),
        CustomDivider(
          margin: EdgeInsets.only(left: (padding + 12) + circleAvatarRadius * 2, bottom: padding),
        )
      ],
    );
  }
}
