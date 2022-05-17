import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/components/custom_opacity_button.dart';

import 'package:travel_app/core/cores.dart';
import 'package:travel_app/extensions/extensions.dart';

//TODO: After finishing Routing Delete Scaffold and SafeArea widgets
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    Key? key,
    this.isLiked = false,
    required this.images,
    required this.viewCount,
    required this.commentCount,
    required this.likeCount,
    required this.rate,
  }) : super(key: key);
  final bool isLiked;
  final List<String> images;
  final int viewCount;
  final int commentCount;
  final int likeCount;
  final double rate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildIconText(R.eyeBlack, viewCount.toString()),
              _buildIconTextReverse(R.comment, commentCount.toString()),
              _buildIconTextReverse(R.heartFilledBlack, likeCount.toString()),
            ],
          )
        ],
      ),
    );
  }

  Row _buildIconText(String iconName, String text) {
    return Row(
      children: <Widget>[SvgPicture.asset(iconName).padding(right: 6), text.mediumTextStyle(13)],
    );
  }

  Row _buildIconTextReverse(String iconName, String text) {
    return Row(
      children: <Widget>[text.mediumTextStyle(13).padding(right: 6), SvgPicture.asset(iconName)],
    );
  }

  Positioned _buildButtonRow() {
    return Positioned(
      top: 40,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CustomOpacityButton(imageName: R.backArrow),
          CustomOpacityButton(imageName: isLiked ? R.heartFilled : R.heartOutlined),
        ],
      ).padding(left: 32, right: 32),
    );
  }
//TODO: Carousel Slider islet

  Container _buildImageContainer(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.40,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(offset: const Offset(2, 2), blurRadius: 8, color: Colors.black.withOpacity(0.8))
        ],
      ),
      child: PageView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(images[index]),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
