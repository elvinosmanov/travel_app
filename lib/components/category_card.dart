import 'package:flutter/material.dart';
import 'package:travel_app/core/colors.dart';
import 'package:travel_app/core/styles.dart';
import 'package:travel_app/extensions/extensions.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.image,
    required this.name,
  }) : super(key: key);
  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      height: 170,
      child: Stack(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: const LinearGradient(
                  colors: [Colors.black, Colors.transparent], begin: Alignment.bottomCenter, end: Alignment.center),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: kMediumTextStyle(12, kWhiteColor),
            ).padding(bottom: 8),
          )
        ],
      ),
    );
  }
}
