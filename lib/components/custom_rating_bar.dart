import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:travel_app/core/colors.dart';

class CustomRatingBar extends StatelessWidget {
  const CustomRatingBar({
    Key? key,
    required this.initialRating,
    this.onPressed,
    this.ignoreGestures = true,
    this.itemSize,
  }) : super(key: key);
  final double initialRating;
  final Function(double value)? onPressed;
  final bool ignoreGestures;
  final double? itemSize;
  @override
  Widget build(BuildContext context) {
    return RatingBar(
      initialRating: initialRating,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      glow: false,
      maxRating: 5,
      minRating: 0,
      itemSize: itemSize ?? 20,
      updateOnDrag: true,
      ignoreGestures: ignoreGestures,
      ratingWidget: RatingWidget(
          full: const Icon(Icons.star, color: kBlueColor),
          half: const Icon(
            Icons.star_half,
            color: kBlueColor,
          ),
          empty: const Icon(
            Icons.star_outline,
            color: kDarkGreyColor,
          )),
      onRatingUpdate: (double value) {
        if (onPressed != null) {
          onPressed!(value);
        }
      },
    );
  }
}
