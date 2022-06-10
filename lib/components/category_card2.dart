import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:travel_app/core/cores.dart';
import 'package:travel_app/extensions/extensions.dart';

class CategoryCard2 extends StatelessWidget {
  const CategoryCard2({
    Key? key,
    required this.title,
    this.textSize,
    required this.location,
    this.placeSize,
    required this.isLiked,
    required this.imageUrl,
    this.onHeartPressed,
    this.onPressed,
    this.width,
    this.height,
  }) : super(key: key);
  final String title;
  final double? textSize;
  final String location;
  final double? placeSize;
  final bool isLiked;
  final String imageUrl;
  final Function()? onHeartPressed;
  final Function()? onPressed;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _buildImageContainer(),
            Flexible(
              child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: kSemiBoldTextStyle(textSize ?? 16),
              ).padding(top: 8, bottom: 6),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SvgPicture.asset(R.mapOutliend),
                Flexible(
                  child: Text(
                    location.useCorrectEllipsis(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: kRegularTextStyle(placeSize ?? 12, kDarkGreyColor),
                  ).padding(left: 4),
                )
              ],
            )
          ],
        ),
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
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              width: width ?? double.infinity,
              height: height,
              fit: BoxFit.cover,
              placeholder: (context, _) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
          Positioned(
            top: 13,
            right: 12,
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: onHeartPressed,
              splashRadius: 100,
              icon: SvgPicture.asset(
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
