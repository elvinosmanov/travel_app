import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/core/constants.dart';
import 'package:travel_app/core/cores.dart';
import 'package:travel_app/extensions/extensions.dart';
import 'package:travel_app/routes/router.gr.dart';

import '../../components/category_card.dart';
import '../../components/category_card2.dart';
import '../../data/app_data.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: <Widget>[
          _buildCustomAppBar().padding(top: defaultTopPadding, bottom: 16),
          Stack(
            clipBehavior: Clip.none,
            children: <Widget>[_buildCoverPhoto(), _buildUserInformation()],
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
    );
  }
}

class MyFavoritesTabView extends StatefulWidget {
  const MyFavoritesTabView({Key? key}) : super(key: key);

  @override
  State<MyFavoritesTabView> createState() => _MyFavoritesTabViewState();
}

class _MyFavoritesTabViewState extends State<MyFavoritesTabView> {
  final data = Category2.data;
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return AlignedGridView.count(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(16),
      crossAxisCount: 3,
      mainAxisSpacing: 16,
      crossAxisSpacing: 8,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return CategoryCard2(
          imageName: data[index].imageName,
          isLiked: data[index].isLiked,
          place: data[index].place,
          text: data[index].text,
          onPressed: () {
            setState(() {
              data[index].isLiked = !data[index].isLiked;
            });
          },
          textSize: 14,
          placeSize: 10,
          height: 160,
        );
      },
    );
  }
}

class RatingsTabView extends StatelessWidget {
  const RatingsTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlignedGridView.count(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(16),
      crossAxisCount: 3,
      mainAxisSpacing: 16,
      crossAxisSpacing: 8,
      itemCount: Category.data.length,
      itemBuilder: (context, index) {
        return CategoryCard.star(
          textSize: 12,
          starValue: 4.5,
          image: Category.data[index].image,
          title: Category.data[index].name,
        );
      },
    );
  }
}

class WillVisitTabView extends StatelessWidget {
  const WillVisitTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        Center(child: const Text('Will Visit TabView').padding(top: 100)),
      ],
    );
  }
}
