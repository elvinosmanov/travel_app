import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:travel_app/core/cores.dart';
import 'package:travel_app/extensions/extensions.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.image,
    required this.title,
    this.textSize,
  })  : starValue = null,
        hasStar = false,
        super(key: key);

  const CategoryCard.star({
    Key? key,
    required this.image,
    required this.title,
    this.textSize,
    this.starValue,
  })  : hasStar = true,
        super(key: key);

  final String image;
  final String title;
  final double? textSize;
  final bool hasStar;
  final double? starValue;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 170,
      child: Stack(
        children: [
          Container(
            clipBehavior: Clip.none,
            decoration: BoxDecoration(
                boxShadow: [kBlueBoxShadow],
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: const LinearGradient(
                  colors: [Colors.black, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.center),
            ),
          ),
          if (hasStar)
            Positioned(
              top: 2,
              right: 2,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                decoration: BoxDecoration(
                    color: kWhiteColor.withOpacity(0.8), borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SvgPicture.asset(R.star).padding(right: 4),
                    (starValue ?? 0.0).toString().regularTextStyle(10)
                  ],
                ),
              ),
            ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              title,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: kMediumTextStyle(textSize ?? 12, kWhiteColor),
            ).padding(bottom: 8, left: 4, right: 4),
          )
        ],
      ),
    );
  }
}
