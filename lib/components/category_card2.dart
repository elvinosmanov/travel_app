import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:travel_app/core/cores.dart';
import 'package:travel_app/extensions/extensions.dart';

class CategoryCard2 extends StatelessWidget {
  const CategoryCard2({
    Key? key,
    required this.text,
    this.textSize,
    required this.place,
    this.placeSize,
    required this.isLiked,
    required this.imageName,
    this.onPressed,
    this.width,
    this.height,
  }) : super(key: key);
  final String text;
  final double? textSize;
  final String place;
  final double? placeSize;
  final bool isLiked;
  final String imageName;
  final Function()? onPressed;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildImageContainer(),
          Flexible(
            child: Text(
              text,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: kSemiBoldTextStyle(textSize ?? 18),
            ).padding(top: 8, bottom: 6),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SvgPicture.asset(R.mapOutliend),
              Flexible(
                child: Text(
                  place.useCorrectEllipsis(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: kRegularTextStyle(placeSize ?? 12, kDarkGreyColor),
                ).padding(left: 4),
              )
            ],
          )
        ],
      ),
    );
  }

  Material _buildImageContainer() {
    return Material(
      borderRadius: BorderRadius.circular(10),
      elevation: 4,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imageName,
              width: width,
              height: height,
              fit: width == null ? BoxFit.cover : BoxFit.fitWidth,
            ),
          ),
          Positioned(
            top: 13,
            right: 12,
            child: GestureDetector(
              onTap: onPressed,
              child: SvgPicture.asset(
                isLiked ? R.heartFilled : R.heartOutlined,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
