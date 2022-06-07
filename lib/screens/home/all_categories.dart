import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:travel_app/components/category_card2.dart';
import 'package:travel_app/components/custom_back_button.dart';
import 'package:travel_app/components/sort_list.dart';
import 'package:travel_app/core/R.dart';
import 'package:travel_app/core/constants.dart';
import 'package:travel_app/cubit/place/place_cubit.dart';
import 'package:travel_app/data/app_data.dart';
import 'package:travel_app/extensions/extensions.dart';
import 'package:travel_app/screens/home/widgets/custom_drop_down_button.dart';

import '../../models/category.dart';
import '../../routes/router.gr.dart';

class AllCategoriesScreen extends StatefulWidget {
  const AllCategoriesScreen({
    Key? key,
    this.selectedCategory,
  }) : super(key: key);
  final CategoryModel? selectedCategory;
  @override
  State<AllCategoriesScreen> createState() => _AllCategoriesScreenState();
}

class _AllCategoriesScreenState extends State<AllCategoriesScreen> {
  // final data = Category2.data;
  CategoryModel? _selectedCategory;
  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.selectedCategory;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final placeCubit = PlaceCubit();
        if(_selectedCategory!=null) {
          placeCubit.getAllPlacesByCategoryId(_selectedCategory!.id);
        }
        return placeCubit;
      },
      child: Scaffold(
          body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomBackButton(
              onPressed: () => context.router.pop(),
            ).padding(left: 16, top: defaultTopPadding, bottom: 16),
            CustomDropDownButton(
              selectedValue: _selectedCategory != null ? _selectedCategory!.name : null,
              onChanged: (String? value) {
                if (_selectedCategory != null) {
                  setState(() {
                    _selectedCategory!.name = value ?? 'Error';
                  });
                }
              },
            ).padding(left: 16),
            const SortList().padding(top: 8, bottom: 8),
            Expanded(child: BlocBuilder<PlaceCubit, PlaceState>(
              builder: (context, state) {
                return MasonryGridView.count(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 8,
                  itemCount: state.places.length,
                  itemBuilder: (context, index) {
                    return CategoryCard2(
                      textSize: 14,
                      imageUrl: state.places[index].imageURLs[0],
                      isLiked: true,
                      location: state.places[index].location,
                      title: state.places[index].title,
                      onPressed: () {
                        context.router.push(
                          DetailsRoute(
                            imageURLs: const [R.accomodationImage, R.gastronomyImage, R.mateImage],
                            likeCount: 350,
                            commentCount: 30,
                            rate: 3.8,
                            viewCount: 14000000,
                            isLiked: false,
                          ),
                        );
                      },
                      onHeartPressed: () {
                        // setState(() {
                        //   data[index].isLiked = !data[index].isLiked;
                        // });
                      },
                    );
                  },
                );
              },
            )),
          ],
        ),
      )),
    );
  }
}
