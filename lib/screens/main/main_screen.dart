import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:travel_app/components/category_card.dart';
import 'package:travel_app/components/content_card.dart';
import 'package:travel_app/components/mini_card.dart';
import 'package:travel_app/components/search_textfield.dart';
import 'package:travel_app/core/cores.dart';
import 'package:travel_app/extensions/extensions.dart';

import '../../components/category_bar.dart';
import '../../components/custom_bottom_navigation.dart';
import '../../components/sort_list.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static const _categories = [
    'All',
    'Popular',
    'Recommended',
    'Most Viewed',
    'Most Rated',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kLightGreyColor_1,
        bottomNavigationBar: const CustomBottomNavigationBar(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: ListView(
              padding: const EdgeInsets.only(bottom: 20),
              physics: const BouncingScrollPhysics(),
              children: [
                const TitleBar().padding(top: 40, bottom: 59),
                'Where do\nyou want to go?'.boldTextStyle(40),
                const SearchTextField().padding(top: 32, bottom: 32),
                const CategoryBar(categoryName: 'Categories'),
                CategoryList().padding(top: 16, bottom: 32),
                const CategoryBar(categoryName: 'Explore'),
                const SortList(
                  categoryNames: _categories,
                ).padding(top: 16, bottom: 16),
                const ExploreList(),
                const CategoryBar(categoryName: 'Travel Guide').padding(top: 32, bottom: 16),
                const TravelGuideList()
              ],
            ),
          ),
        ));
  }
}

class TravelGuideList extends StatelessWidget {
  const TravelGuideList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 84,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) => MiniCard(
          imageName: R.flagInterestImage,
          place: 'Mingachevir',
        ).padding(right: 8),
      ),
    );
  }
}

class ExploreList extends StatelessWidget {
  const ExploreList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return const ContentCard(
              starValue: 4.6, image: R.tripImage, name: "Gobustan milli parkı", place: 'Karadagh, Baku');
        },
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
  CategoryList({Key? key}) : super(key: key);

  final _data = [
    Category('History and Culture', R.mateImage),
    Category('Museum and Art', R.mateImage),
    Category('Accommodation', R.mateImage),
    Category('Shopping', R.mateImage),
    Category('Gastronomy', R.mateImage),
    Category('Nature and Agro', R.mateImage),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: _data.length,
        itemBuilder: (context, index) {
          return CategoryCard(
            image: _data[index].image,
            name: _data[index].name,
          ).padding(right: 8);
        },
      ),
    );
  }
}

class Category {
  final String name;
  final String image;

  Category(this.name, this.image);
}

class TitleBar extends StatelessWidget {
  const TitleBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const CircleAvatar(
          backgroundImage: AssetImage(R.mateImage),
          radius: 20,
        ).padding(right: 8),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>['Welcome 👋'.mediumTextStyle(13), 'Elvin'.semiBoldTextStyle(22)],
        ),
        const Spacer(),
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(color: kWhiteColor, borderRadius: kRadius16, boxShadow: [kBlackBoxShadow]),
          child: SvgPicture.asset(
            R.notification,
            fit: BoxFit.scaleDown,
          ),
        )
      ],
    );
  }
}
