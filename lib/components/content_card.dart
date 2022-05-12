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
  }) : super(key: key);
  final double starValue;
  final String image;
  final String name;
  final String place;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 230,
      child: Container(
        decoration: BoxDecoration(color: kWhiteColor, borderRadius: kRadius16),
        padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
        margin: const EdgeInsets.only(right: 16),
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
                    name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: kSemiBoldTextStyle(18),
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
                          style: kSemiBoldTextStyle(15, kDarkGreyColor),
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
      child: Container(
        height: 210,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
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
