import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:travel_app/core/colors.dart';

class CustomRatingBar extends StatelessWidget {
  const CustomRatingBar({
    Key? key,
    required this.rating,
  }) : super(key: key);
  final double rating;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        RatingBar(
          initialRating: rating,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          glow: false,
          maxRating: 5,
          minRating: 0,
          itemSize: 20,
          updateOnDrag: false,
          ignoreGestures: true,
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
          onRatingUpdate: (double value) {},
        ),
      ],
    );
  }
}