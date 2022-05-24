import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/components/custom_divider.dart';
import 'package:travel_app/core/constants.dart';
import 'package:travel_app/core/cores.dart';
import 'package:travel_app/extensions/extensions.dart';
import 'package:travel_app/routes/router.gr.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? imageFile;

  void showBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: kWhiteColor,
      elevation: 2,
      barrierColor: Colors.black54,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 4,
              width: 60,
              margin: const EdgeInsets.only(top: 12),
              decoration: BoxDecoration(
                borderRadius: kRadius16,
                color: kDarkGreyColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>['Profile Photo'.semiBoldTextStyle(18), SvgPicture.asset(R.delete)],
            ).padding(left: 32, right: 32, bottom: 4, top: 8),
            CustomDivider(color: Colors.black.withOpacity(0.1)),
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: kLightGreyColor_1, borderRadius: BorderRadius.circular(16)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>['Add from Photo Library'.mediumTextStyle(14), SvgPicture.asset(R.image)],
                  ).padding(left: 16, right: 16, bottom: 10, top: 10),
                  CustomDivider(color: Colors.black.withOpacity(0.1)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>['Take a photo'.mediumTextStyle(14), SvgPicture.asset(R.camera)],
                  ).padding(left: 16, right: 16, bottom: 10, top: 10),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: <Widget>[
          _buildCustomAppBar().padding(top: defaultTopPadding, bottom: 16),
          SizedBox(
            height: 200 + 90,
            child: Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                _buildCoverPhoto(),
                _buildUserInformation(),
              ],
            ),
          ),
          const SizedBox(height: 120),
          Expanded(
            child: AutoTabsRouter.tabBar(
              routes: const [
                MyFavoritesTab(),
                RatingsTab(),
                WillVisitTab(),
              ],
              builder: (context, child, tabController) {
                return Container(
                  color: Colors.red,
                  child: Scaffold(
                    appBar: PreferredSize(
                      preferredSize: const Size.fromHeight(kToolbarHeight),
                      child: TabBar(
                        labelStyle: kMediumTextStyle(13, kDarkGreyColor),
                        labelColor: kBlueColor,
                        unselectedLabelColor: kDarkGreyColor,
                        controller: tabController,
                        tabs: const [
                          Tab(text: 'My Favorites'),
                          Tab(text: 'Ratings'),
                          Tab(text: 'Will Visit'),
                        ],
                      ),
                    ),
                    body: child,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  ClipRRect _buildCoverPhoto() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        R.museumAndArtImage,
        width: 1000,
        height: 200,
        fit: BoxFit.cover,
      ),
    );
  }

  Row _buildCustomAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        'elvinosmanov'.semiBoldTextStyle(18, kBlueColor),
        SvgPicture.asset(
          R.settings,
          fit: BoxFit.scaleDown,
        )
      ],
    );
  }

  Positioned _buildUserInformation() {
    return Positioned(
      bottom: 0,
      left: 24,
      child: Row(
        children: [
          InkWell(
            onTap: () => showBottomSheet(),
            child: Stack(
              children: const [
                CircleAvatar(
                  radius: 70,
                  backgroundColor: kLightGreyColor_1,
                  child: CircleAvatar(radius: 66, backgroundImage: AssetImage(R.accomodationImage)),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: Material(
                      shape: CircleBorder(),
                      elevation: 2,
                      child: CircleAvatar(
                        backgroundColor: kLightGreyColor_1,
                        radius: 25,
                        child: Icon(
                          Icons.camera_alt_sharp,
                          color: kBlueColor,
                        ),
                      ),
                    ))
              ],
            ),
          ),
          Column(
            // mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              'Elvin Osmanov'.semiBoldTextStyle(22),
              'Baku, Azerbaijan'.mediumTextStyle(13),
            ],
          ).padding(top: 20, left: 4),
        ],
      ),
    );
  }
}
