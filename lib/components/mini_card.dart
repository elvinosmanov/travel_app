import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:travel_app/core/cores.dart';
import 'package:travel_app/extensions/extensions.dart';

class MiniCard extends StatelessWidget {
  MiniCard({
    Key? key,
    required this.imageName,
    required this.place,
  }) : super(key: key);
  final String imageName;
  final String place;
  final BorderRadius _radius = BorderRadius.circular(8);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 84,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(color: kWhiteColor, borderRadius: _radius, boxShadow: [kBlackBoxShadow]),
      child: Stack(
        children: [
          SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: ClipRRect(borderRadius: _radius, child: Image.asset(imageName, fit: BoxFit.cover))),
          Positioned(
            bottom: 8,
            left: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
              decoration: BoxDecoration(color: kWhiteColor.withOpacity(0.6), borderRadius: BorderRadius.circular(6)),
              child: Row(
                children: <Widget>[
                  SvgPicture.asset(
                    R.map,
                    height: 9,
                    fit: BoxFit.scaleDown,
                  ),
                  place.semiBoldTextStyle(11)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
