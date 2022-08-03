import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/components/search_textfield.dart';
import 'package:travel_app/core/constants.dart';
import 'package:travel_app/cubit/category/category_cubit.dart';
import 'package:travel_app/cubit/place/place_cubit.dart';
import 'package:travel_app/extensions/extensions.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/components/category_card.dart';
import 'package:travel_app/components/content_card.dart';
import 'package:travel_app/components/mini_card.dart';
import 'package:travel_app/core/cores.dart';
import 'package:travel_app/models/place.dart';
import 'package:travel_app/routes/router.gr.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../components/category_bar.dart';
import '../../components/sort_list.dart';
import '../../cubit/like/like_cubit.dart';
import '../../repositories/place_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = ScrollController();
  @override
  void initState() {
    super.initState();
    context.read<CategoryCubit>().getAllCategories();
    context.read<PlaceCubit>().getAllPlacesBy(categoryId: kAllCategoryId);

    context.read<PlaceCubit>().changePlaceSortValue(PlaceSorts.popular);

    _controller.addListener(() {
      if (_controller.position.pixels < 0) _controller.jumpTo(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthBloc>().state.user;
    if(user!=null) {
      context.read<LikeCubit>().getAllUserLikes(user.id!);
    }
    return ListView(
      controller: _controller,
      padding: const EdgeInsets.only(bottom: 20),
      physics: const BouncingScrollPhysics(),
      children: [
        const TitleBar().padding(top: defaultTopPadding, bottom: 59, left: 16, right: 16),
        'Where do\nyou want to go?'.boldTextStyle(40).padding(left: 16),
        SearchTextField(
          enabled: false,
          onPressed: () {
            context.router.pushNamed('/search/');
          },
        ).padding(top: 32, bottom: 32, left: 16, right: 16),
        CategoryBar(
          categoryName: 'Categories',
          onPressed: () {
            // ignore: avoid_print
            context.router.push(const CategoriesRoute());
          },
        ),
        const CategoryList().padding(top: 16, bottom: 32),
        CategoryBar(
          categoryName: 'Explore',
          onPressed: () => context.router.push(AllCategoriesRoute()),
        ),
        const SortList().padding(top: 8), //bottom: 16-6
        const ExploreList(),

        CategoryBar(
          categoryName: 'New Added',
          onPressed: () {
            context.read<PlaceCubit>().changePlaceSortValue(PlaceSorts.newAdded);
            return context.router.push(AllCategoriesRoute());
          },
        ).padding(top: 22, bottom: 16), //bottom: 32-10 22
        RepositoryProvider(
          create: (context) => PlaceRepository()..getAllPlacesByCategoryId(kAllCategoryId),
          child: BlocProvider(
            create: (context) => PlaceCubit(placeRepository: context.read<PlaceRepository>())
              ..changePlaceSortValue(PlaceSorts.newAdded)
              ..getAllPlacesBy(),
            child: const NewAddedList(),
          ),
        ),
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
      child: BlocConsumer<PlaceCubit, PlaceState>(
        listener: (context, state) {
          //TODO Listener bloc istifade etmeyeceksense blocbuildere geri cevir.
        },
        // buildWhen: (previous, current) => previous.sortedValue != current.sortedValue,
        builder: (context, state) {
          List<PlaceModel> placeModelList = state.places;
          return ListView.builder(
            padding: const EdgeInsets.only(top: 10, bottom: 10, left: 16),
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: placeModelList.length,
            itemBuilder: (context, index) {
              return ContentCard(
                width: 230,
                height: 280,
                starValue: placeModelList[index].rateAvgCount,
                imageURL: placeModelList[index].imageURLs[0],
                title: placeModelList[index].title,
                location: placeModelList[index].locationName,
                onPressed: () => context.router.push(
                  DetailsRoute(placeId: state.places[index].id),
                ),
              ).padding(right: 16);
            },
          );
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
    return BlocBuilder<PlaceCubit, PlaceState>(
      buildWhen: (previous, current) => previous.places != current.places,
      builder: (context, state) {
        List<PlaceModel> placeModelList = state.places;
        return ListView.builder(
          padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const ClampingScrollPhysics(),
          itemCount: placeModelList.length,
          itemBuilder: (context, index) {
            return AspectRatio(
              aspectRatio: 1 / 1.05,
              child: ContentCard(
                starValue: placeModelList[index].rateAvgCount,
                imageURL: placeModelList[index].imageURLs[0],
                title: placeModelList[index].title,
                location: placeModelList[index].locationName,
                isHorizontal: false,
                onPressed: () => context.router.push(
                  DetailsRoute(placeId: state.places[index].id),
                ),
              ).padding(bottom: 16),
            );
          },
        );
      },
    );
  }
}

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: BlocBuilder<CategoryCubit, CategoryState>(
        buildWhen: (previous, current) => previous.categoryList != current.categoryList,
        builder: (context, state) {
          return ListView.builder(
            clipBehavior: Clip.none,
            padding: const EdgeInsets.only(left: 16.0),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: state.categoryList.length,
            itemBuilder: (context, index) {
              return CategoryCard(
                onPressed: () => context.router.push(AllCategoriesRoute(selectedCategory: state.categoryList[index])),
                image: state.categoryList[index]!.imageURL,
                title: state.categoryList[index]!.name,
              ).padding(right: 8);
            },
          );
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
