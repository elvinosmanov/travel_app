import 'package:flutter/material.dart';
import 'package:travel_app/components/search_textfield.dart';
import 'package:travel_app/extensions/extensions.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/components/category_card.dart';
import 'package:travel_app/components/content_card.dart';
import 'package:travel_app/components/mini_card.dart';
import 'package:travel_app/core/cores.dart';
import '../../components/category_bar.dart';
import '../../components/sort_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const _categories = [
    'All',
    'Popular',
    'Recommended',
    'Most Viewed',
    'Most Rated',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
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
        ).padding(top: 16, bottom: 6), //bottom: 16-6
        const ExploreList(),
        const CategoryBar(categoryName: 'New Added').padding(top: 22, bottom: 16), //bottom: 32-10 22
        const NewAddedList(),
        const CategoryBar(categoryName: 'Travel Guide').padding(top: 32, bottom: 6),
        const TravelGuideList(),
      ],
    );
  }
}

class TravelGuideList extends StatelessWidget {
  const TravelGuideList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 104,
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
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
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return const ContentCard(
                  width: 230,
                  height: 280,
                  starValue: 4.6,
                  image: R.tripImage,
                  name: "Gobustan milli parkı",
                  place: 'Karadagh, Baku')
              .padding(right: 16);
        },
      ),
    );
  }
}

class NewAddedList extends StatelessWidget {
  const NewAddedList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ListView.builder(
      padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const ClampingScrollPhysics(),
      itemCount: 4,
      itemBuilder: (context, index) {
        return AspectRatio(
          aspectRatio: 1 / 1.05,
          child: const ContentCard(
            starValue: 4.6,
            image: R.tripImage,
            name: "Gobustan milli parkı",
            place: 'Karadagh, Baku',
            isHorizontal: false,
          ).padding(bottom: 16),
        );
      },
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
