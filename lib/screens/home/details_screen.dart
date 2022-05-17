import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:travel_app/core/cores.dart';
import 'package:travel_app/extensions/extensions.dart';

//TODO: After finishing Routing Delete Scaffold and SafeArea widgets
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    Key? key,
    this.isLiked = false,
    required this.images,
    required this.viewCount,
    required this.messageCount,
    required this.likeCount,
    required this.rate,
  }) : super(key: key);
  final bool isLiked;
  final List<String> images;
  final int viewCount;
  final int messageCount;
  final int likeCount;
  final double rate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                _buildImageContainer(context),
                _buildButtonRow(),
                Positioned(
                    bottom: 16,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: 10,
                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                      color: Colors.red,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  Positioned _buildButtonRow() {
    return Positioned(
      top: 40,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const CustomOpacityButton(imageName: R.backArrow),
          CustomOpacityButton(imageName: isLiked ? R.heartFilled : R.heartOutlined),
        ],
      ).padding(left: 32, right: 32),
    );
  }

  Container _buildImageContainer(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.40,
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(offset: const Offset(2, 2), blurRadius: 8, color: Colors.black.withOpacity(0.8))],
      ),
      child: PageView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(R.accomodation),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}

class CustomOpacityButton extends StatelessWidget {
  const CustomOpacityButton({
    Key? key,
    required this.imageName,
    this.width,
    this.height,
    this.opacity,
    this.onPressed,
  }) : super(key: key);
  final String imageName;
  final double? width;
  final double? height;
  final double? opacity;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width ?? 44,
        height: height ?? 44,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: kWhiteColor.withOpacity(opacity ?? 0.9),
            boxShadow: [kBlackBoxShadow]),
        child: SvgPicture.asset(
          imageName,
          color: kBlackColor,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
