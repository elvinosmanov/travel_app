import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/components/search_textfield.dart';
import 'package:travel_app/core/constants.dart';
import 'package:travel_app/data/app_data.dart';
import 'package:travel_app/extensions/extensions.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/components/category_card.dart';
import 'package:travel_app/components/content_card.dart';
import 'package:travel_app/components/mini_card.dart';
import 'package:travel_app/core/cores.dart';
import 'package:travel_app/routes/router.gr.dart';
import '../../components/category_bar.dart';
import '../../components/sort_list.dart';
import '../../cubit/navigation/navigation_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _exploreSortValue = 0;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 20),
      physics: const BouncingScrollPhysics(),
      children: [
        const TitleBar().padding(top: defaultTopPadding, bottom: 59, left: 16, right: 16),
        'Where do\nyou want to go?'.boldTextStyle(40).padding(left: 16),
        SearchTextField(
          enabled: false,
          onPressed: () {
            context.read<NavigationCubit>().onItemTapped(1);
          },
        ).padding(top: 32, bottom: 32, left: 16, right: 16),
        CategoryBar(
          categoryName: 'Categories',
          onPressed: () {
            // ignore: avoid_print
            print('object');
            context.router.push(const CategoriesRoute());
          },
        ),
        const CategoryList().padding(top: 16, bottom: 32),
        CategoryBar(
          categoryName: 'Explore',
          onPressed: () => context.router.push(AllCategoriesRoute(initialSortValue: _exploreSortValue)),
        ),
        SortList(
          initialValue: _exploreSortValue,
          onChanged: (value) {
            setState(() {
              _exploreSortValue = value;
            });
          },
          categoryNames: categoriesSorts,
        ).padding(top: 8), //bottom: 16-6
        const ExploreList(),
        CategoryBar(
          categoryName: 'New Added',
          onPressed: () => context.router.push(
              AllCategoriesRoute(initialSortValue: categoriesSorts.indexWhere((element) => element == 'New Added'))),
        ).padding(top: 22, bottom: 16), //bottom: 32-10 22
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
      height: 124,
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 16),
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
        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 16),
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
  const CategoryList({Key? key}) : super(key: key);

  final _data = Category.data;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView.builder(
        clipBehavior: Clip.none,
        padding: const EdgeInsets.only(left: 16.0),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: _data.length,
        itemBuilder: (context, index) {
          return CategoryCard(
            onPressed: () => context.router.push(AllCategoriesRoute(selectedValue: categoryNames[index + 1])),
            image: _data[index].image,
            title: _data[index].name,
          ).padding(right: 8);
        },
      ),
    );
  }
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
