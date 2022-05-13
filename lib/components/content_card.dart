import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:travel_app/core/cores.dart';
import 'package:travel_app/extensions/extensions.dart';

class ContentCard extends StatelessWidget {
  const ContentCard({
    Key? key,
    required this.starValue,
    required this.image,
    required this.name,
    required this.place,
    this.isHorizontal = true,
    this.width,
    this.height,
  }) : super(key: key);
  final double starValue;
  final String image;
  final String name;
  final String place;
  final bool isHorizontal;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Container(
        decoration: BoxDecoration(color: kWhiteColor, borderRadius: kRadius16, boxShadow: [kBlackBoxShadow]),
        padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [_buildImageContainer(), _buildStarValue()]),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    isHorizontal ? name : name.useCorrectEllipsis(),
                    maxLines: isHorizontal ? 2 : 1,
                    overflow: TextOverflow.ellipsis,
                    style: kSemiBoldTextStyle(isHorizontal ? 14 : 18),
                  ).padding(top: 6),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SvgPicture.asset(R.map).padding(right: 2),
                      Flexible(
                        child: Text(
                          place.useCorrectEllipsis(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: kSemiBoldTextStyle(isHorizontal ? 12 : 14, kDarkGreyColor),
                        ),
                      )
                    ],
                  ).padding(bottom: 8)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Align _buildImageContainer() {
    return Align(
      alignment: Alignment.topCenter,
      child: AspectRatio(
        aspectRatio: isHorizontal ? 206 / 210 : 6 / 5,
        child: Container(
          // height: 210,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }

  Positioned _buildStarValue() {
    return Positioned(
      right: 8,
      top: 8,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: kWhiteColor.withOpacity(0.8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SvgPicture.asset(R.star).padding(right: 10),
            starValue.toString().regularTextStyle(12),
          ],
        ),
      ),
    );
  }
}
