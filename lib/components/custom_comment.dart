import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:travel_app/components/custom_divider.dart';
import 'package:travel_app/components/custom_rating_bar.dart';
import 'package:travel_app/core/cores.dart';
import 'package:travel_app/extensions/date_time_extension.dart';
import 'package:travel_app/extensions/extensions.dart';
import 'package:travel_app/models/comment.dart';

class CustomComment extends StatelessWidget {
  const CustomComment({
    Key? key,
    required this.commentModel,
  }) : super(key: key);
  final CommentModel commentModel;
  final double circleAvatarRadius = 26;
  final double padding = 16;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              radius: circleAvatarRadius,
              backgroundImage: CachedNetworkImageProvider(commentModel.imageUrl),
            ).padding(right: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                commentModel.submittedBy.semiBoldTextStyle(15),
                CustomRatingBar(initialRating: commentModel.rate)
              ],
            ),
            const Spacer(),
            Text(
              commentModel.createdDate.toReadableString(),
              textAlign: TextAlign.end,
              style: kMediumTextStyle(11, kDarkGreyColor),
            )
          ],
        ).padding(left: padding, right: padding),
        const SizedBox(height: 12),
        if (commentModel.comment.isNotEmpty)
          Text(
            commentModel.comment,
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
