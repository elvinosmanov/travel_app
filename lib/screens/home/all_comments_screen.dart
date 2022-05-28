import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:travel_app/components/custom_back_button.dart';
import 'package:travel_app/components/custom_divider.dart';
import 'package:travel_app/components/custom_rating_bar.dart';
import 'package:travel_app/components/custom_textfield.dart';
import 'package:travel_app/core/cores.dart';
import 'package:travel_app/extensions/extensions.dart';

import '../../components/custom_comment.dart';

class AllCommentsScreen extends StatelessWidget {
  //TODO: commentsListin lengthi olacaq deye bu variable a ehtiyac olmayacaq
  final commentsNumber = 8;
  const AllCommentsScreen({
    Key? key,
    // required this.commentsList,
  }) : super(key: key);
  // final List commentsList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomBackButton(
              label: '$commentsNumber Comments',
            ).padding(top: 20, bottom: 20, left: 16),
            const CustomDivider(),
            Expanded(
              child: ListView(
                children: <Widget>[
                  const ReviewList(),
                  _buildCommentList(),
                ],
              ),
            ),
            _buildSendMessage()
          ],
        ),
      ),
    );
  }

  Align _buildSendMessage() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        // height: 140,
        decoration: BoxDecoration(
          color: kLightGreyColor_1,
          boxShadow: [
            BoxShadow(blurRadius: 3, spreadRadius: 3, offset: const Offset(0, 2), color: Colors.black.withOpacity(0.2))
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: <Widget>[
                'Rate us'.mediumTextStyle(15),
                'Your likes are important to us'.regularTextStyle(11, kDarkGreyColor),
                CustomRatingBar(
                    initialRating: 0,
                    itemSize: 26,
                    ignoreGestures: false,
                    onPressed: (value) {
                      print(value);
                    }).padding(top: 8, bottom: 8),
              ],
            ),
            Container(
              constraints: const BoxConstraints(maxHeight: 120),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: CustomTextField(
                      // maxLines: 4,
                      textInputAction: TextInputAction.newline,
                      controller: TextEditingController(),
                      hintText: 'Write a comment',
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        print('context');
                      },
                      icon: SvgPicture.asset(R.send))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //TODO: Kecici olaraq, sonra comments detailsden gelecek
  ListView _buildCommentList() {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: commentsNumber,
        itemBuilder: (context, index) {
          return const CustomComment(
            comment:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            imageName: R.flagInterestImage,
            name: 'Elvin',
            rating: 3.1,
            surname: 'Osmanov',
            time: '1 hours ago',
          );
        });
  }
}

class ReviewList extends StatefulWidget {
  const ReviewList({
    Key? key,
    this.onPressed,
  }) : super(key: key);
  final Function(int value)? onPressed;
  @override
  State<ReviewList> createState() => _ReviewListState();
}

class _ReviewListState extends State<ReviewList> {
  final List<String> reviewList = [
    'All Review',
    '5',
    '4',
    '3',
    '2',
    '1',
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 16.0, top: 20, bottom: 20),
        scrollDirection: Axis.horizontal,
        itemCount: reviewList.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          if (index == 0) {
            return ReviewListItem(
                isActive: _selectedIndex == index,
                itemName: reviewList[index],
                hasStar: false,
                onPressed: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                }).padding(right: 12);
          }
          return ReviewListItem(
              isActive: _selectedIndex == index,
              itemName: reviewList[index],
              onPressed: () {
                setState(() {
                  _selectedIndex = index;
                });
              }).padding(right: 12);
        },
      ),
    );
  }
}

class ReviewListItem extends StatelessWidget {
  const ReviewListItem({
    Key? key,
    this.isActive = false,
    this.hasStar = true,
    required this.itemName,
    required this.onPressed,
  }) : super(key: key);
  final bool isActive;
  final bool hasStar;
  final String itemName;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      color: isActive ? kLightBlueColor : kWhiteColor,
      borderRadius: kRadius8,
      child: InkWell(
        borderRadius: kRadius8,
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: kRadius8,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (hasStar)
                SvgPicture.asset(
                  R.star,
                  fit: BoxFit.scaleDown,
                ).padding(right: 8),
              itemName.semiBoldTextStyle(15, isActive ? kBlueColor : kDarkGreyColor),
            ],
          ),
        ),
      ),
    );
  }
}
