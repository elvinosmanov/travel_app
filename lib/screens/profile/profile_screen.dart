import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/core/constants.dart';
import 'package:travel_app/core/cores.dart';
import 'package:travel_app/extensions/extensions.dart';
import 'package:travel_app/routes/router.gr.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              'elvinosmanov'.semiBoldTextStyle(18, kBlueColor),
              SvgPicture.asset(
                R.settings,
                fit: BoxFit.scaleDown,
              )
            ],
          ).padding(top: defaultTopPadding, bottom: 16),
          Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  R.museumAndArtImage,
                  width: 1000,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: -90,
                left: 24,
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 70,
                      backgroundColor: kLightGreyColor_1,
                      child: CircleAvatar(radius: 66, backgroundImage: AssetImage(R.accomodationImage)),
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
              )
            ],
          ),
          SizedBox(
            height: 100,
          ),
          AutoTabsRouter.tabBar(
            builder: (context, child, tabController) {
              return TabBar(
                labelStyle: kMediumTextStyle(13, kDarkGreyColor),
                labelColor: kBlueColor,
                unselectedLabelColor: kDarkGreyColor,
                controller: tabController,
                tabs: const [
                  Tab(text: 'My Favorites'),
                  Tab(text: 'Ratings'),
                  Tab(text: 'Will Visit'),
                ],
              );
            },
            homeIndex: 0,
            routes: const [
              MyFavoritesTabViewRoute(),
              RatingsTabViewRoute(),
              WillVisitTabViewRoute(),
            ],
          )
        ],
      ),
    );
  }
}

class MyFavoritesTabView extends StatelessWidget {
  const MyFavoritesTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('text1'),
    );
  }
}

class RatingsTabView extends StatelessWidget {
  const RatingsTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('text2'),
    );
  }
}

class WillVisitTabView extends StatelessWidget {
  const WillVisitTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('text3'),
    );
  }
}
