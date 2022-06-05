import 'package:cached_network_image/cached_network_image.dart';
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
    this.onPressed,
  })  : starValue = null,
        hasStar = false,
        super(key: key);

  const CategoryCard.star({
    Key? key,
    required this.image,
    required this.title,
    this.textSize,
    this.starValue,
    this.onPressed,
  })  : hasStar = true,
        super(key: key);

  final String image;
  final String title;
  final double? textSize;
  final bool hasStar;
  final double? starValue;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(8),
      child: GestureDetector(
        onTap: onPressed,
        child: SizedBox(
          width: 120,
          height: 170,
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.fitHeight,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: const LinearGradient(
                        colors: [Colors.black, Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.center),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
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
                        color: kWhiteColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(8)),
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
        ),
      ),
    );
  }
}
