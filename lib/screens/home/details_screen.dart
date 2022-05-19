import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/components/category_bar.dart';
import 'package:travel_app/components/category_card2.dart';
import 'package:travel_app/components/content_card.dart';
import 'package:travel_app/components/custom_comment.dart';

import 'package:travel_app/components/custom_divider.dart';
import 'package:travel_app/components/custom_opacity_button.dart';
import 'package:travel_app/core/cores.dart';
import 'package:travel_app/extensions/extensions.dart';

import '../../components/category_card.dart';
import '../../components/custom_rating_bar.dart';

//TODO: After finishing Routing Delete Scaffold and SafeArea widgets
class DetailsScreen extends StatefulWidget {
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
  // final String title;
  // final String place;
  // final String context;
  // final bool willVisit;
  // final
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool isReadmore = false;
  final _controller = ScrollController();
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.position.pixels < 0) _controller.jumpTo(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        controller: _controller,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DetailsImageContainer(
            images: widget.images,
            isLiked: widget.isLiked,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildTwoChildrenRow(
                  SvgPicture.asset(R.eyeBlack), widget.viewCount.viewCountToString().mediumTextStyle(15)),
              _buildTwoChildrenRow(
                  widget.rate.toStringAsFixed(1).mediumTextStyle(15),
                  CustomRatingBar(
                    rating: widget.rate,
                  )),
              _buildTwoChildrenRow(widget.commentCount.toString().mediumTextStyle(15), SvgPicture.asset(R.comment)),
              _buildTwoChildrenRow(
                  widget.likeCount.toString().mediumTextStyle(15), SvgPicture.asset(R.heartFilledBlack)),
            ],
          ).padding(all: 16),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomDivider(),
                'Old City'.heading1().padding(top: 32, bottom: 4),
                Row(
                  children: <Widget>[
                    SvgPicture.asset(R.map, fit: BoxFit.scaleDown).padding(right: 2),
                    'Baku'.semiBoldTextStyle(15, kDarkGreyColor)
                  ],
                ),
                const CustomVisitButton(),
                'About'.semiBoldTextStyle(18).padding(top: 16, bottom: 10),
                buildText(
                    'view of the lower city and mountains. Good to visit even when cloudy or raining because tview of the lower city and mountains. Good to visit even when cloudy or raining because they have a friendly pupper to keep fdview of the lower city and mountains. Good to visit even when cloudy or raining because they have a friendly pupper to keep fdview of the lower city and mountains. Good to visit even when cloudy or raining because they have a friendly pupper to keep fdhey have a friendly pupper to keep fd'),
              ],
            ),
          ),
          _buildReadMoreButton().padding(bottom: 8, left: 8),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: <Widget>[
                    'Location'.semiBoldTextStyle(18),
                    const Spacer(),
                    SvgPicture.asset(R.sendNavigation).padding(right: 8),
                    '1.2km'.semiBoldTextStyle(13, kDarkGreyColor),
                  ],
                ).padding(top: 16, bottom: 10),
                _buildMap(),
                'Comments'.semiBoldTextStyle(22).padding(top: 24, bottom: 16),
              ],
            ),
          ),
          _buildCommentList(),
          _buildSeeAllReviewsButton().padding(bottom: 32),
          const CategoryBar(
            categoryName: 'Places May You Like',
            color: kBlueColor,
          ).padding(bottom: 16),
          SizedBox(
            height: 240,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(left: 16),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const CategoryCard2(
                    width: 150,
                    text: 'Gobustan Stones',
                    place: 'Gobustan, Azerbaijan',
                    isLiked: false,
                    imageName: R.shoppingImage,
                  ).padding(right: 16);
                }),
          )
        ],
      ),
    );
  }

  Row _buildSeeAllReviewsButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          child: 'See All Reviews'.mediumTextStyle(13, kDarkGreyColor),
        )
      ],
    );
  }

  ListView _buildCommentList() {
    return ListView.builder(
        cacheExtent: 10,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return const CustomComment(
            comment:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
            imageName: R.flagInterestImage,
            name: 'Elvin',
            rating: 3.1,
            surname: 'Osmanov',
            time: '1 hours ago',
          );
        });
  }

  GestureDetector _buildReadMoreButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isReadmore = !isReadmore;
        });
      },
      child: (!isReadmore ? 'Read more' : 'Read less').mediumTextStyle(15, kBlueColor).padding(all: 8),
    );
  }

  Container _buildMap() {
    return Container(
      width: double.infinity,
      height: 170,
      decoration: BoxDecoration(
        borderRadius: kRadius16,
        color: kLightGreyColor_4,
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              R.map,
              fit: BoxFit.scaleDown,
            ).padding(bottom: 16),
          )
        ],
      ),
    );
  }

  Row _buildTwoChildrenRow(Widget widget1, Widget widget2) {
    return Row(
      children: <Widget>[widget1.padding(right: 6), widget2],
    );
  }

  buildText(String text) {
    final lines = isReadmore ? null : 3;
    return Text(
      text,
      style: kRegularTextStyle(15).copyWith(height: 1.4),
      maxLines: lines,
      overflow: isReadmore ? TextOverflow.visible : TextOverflow.ellipsis,
    );
  }
}

class DetailsImageContainer extends StatefulWidget {
  const DetailsImageContainer({
    Key? key,
    required this.images,
    required this.isLiked,
  }) : super(key: key);
  final List<String> images;
  final bool isLiked;

  @override
  State<DetailsImageContainer> createState() => _DetailsImageContainerState();
}

class _DetailsImageContainerState extends State<DetailsImageContainer> {
  int _current = 0;
  bool _isLiked = false;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          items: widget.images.map((item) => Image.asset(item, fit: BoxFit.cover, width: 1000.0)).toList(),
          carouselController: _controller,
          options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 0.4,
              viewportFraction: 1,
              initialPage: 0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        _buildButtonRow(),
        Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                  decoration: BoxDecoration(color: kWhiteColor.withOpacity(0.57), borderRadius: kRadius16),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.images.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () {
                          print(entry.key);
                          _controller.animateToPage(entry.key);
                        },
                        child: Container(
                          width: 8.0,
                          height: 8.0,
                          margin: const EdgeInsets.symmetric(horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current == entry.key ? kBlueColor : kDarkGreyColor,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ))
      ],
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
          CustomOpacityButton(
            imageName: R.backArrow,
            onPressed: () {},
          ),
          CustomOpacityButton(
            imageName: _isLiked ? R.heartFilled : R.heartOutlined,
            onPressed: () {
              setState(() {
                _isLiked = !_isLiked;
              });
            },
          ),
        ],
      ).padding(left: 32, right: 32),
    );
  }
}

class CustomVisitButton extends StatefulWidget {
  const CustomVisitButton({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomVisitButton> createState() => _CustomVisitButtonState();
}

class _CustomVisitButtonState extends State<CustomVisitButton> {
  bool willVisit = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Material(
          borderRadius: BorderRadius.circular(4),
          color: willVisit ? kLightBlueColor : kWhiteColor,
          child: InkWell(
            borderRadius: BorderRadius.circular(4),
            onTap: () {
              () {
                setState(() {
                  willVisit = !willVisit;
                });
              };
            },
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), boxShadow: [kBlackBoxShadow]),
              child: Row(
                children: <Widget>[
                  SvgPicture.asset(R.worldMap).padding(right: 4),
                  (willVisit ? 'Will visit' : 'Will not visit').semiBoldTextStyle(14, kBlueColor)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
