import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:travel_app/components/category_card2.dart';
import 'package:travel_app/components/custom_back_button.dart';
import 'package:travel_app/components/sort_list.dart';
import 'package:travel_app/core/R.dart';
import 'package:travel_app/core/constants.dart';
import 'package:travel_app/data/app_data.dart';
import 'package:travel_app/extensions/extensions.dart';
import 'package:travel_app/screens/home/widgets/custom_drop_down_button.dart';

import '../../routes/router.gr.dart';

class AllCategoriesScreen extends StatefulWidget {
  const AllCategoriesScreen({
    Key? key,
    @PathParam('id') this.selectedValue,
    @PathParam('sortId') this.initialSortValue,
  }) : super(key: key);
  final String? selectedValue;
  final int? initialSortValue;
  @override
  State<AllCategoriesScreen> createState() => _AllCategoriesScreenState();
}

class _AllCategoriesScreenState extends State<AllCategoriesScreen> {
  final data = Category2.data;
  String? selectedValue;
  @override
  void initState() {
    super.initState();
    selectedValue = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomBackButton(
            onPressed: () => context.router.pop(),
          ).padding(left: 16, top: defaultTopPadding, bottom: 16),
          CustomDropDownButton(
            selectedValue: selectedValue,
            onChanged: (String? value) {
              setState(() {
                selectedValue = value;
              });
            },
          ).padding(left: 16),
          SortList(
            categorySortNames: categoriesSorts,
            initialValue: widget.initialSortValue ?? 0,
          ).padding(top: 8, bottom: 8),
          Expanded(
              child: MasonryGridView.count(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 8,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return CategoryCard2(
                textSize: 14,
                imageName: data[index].imageName,
                isLiked: data[index].isLiked,
                place: data[index].place,
                text: data[index].text,
                onPressed: () {
                  context.router.push(
                    DetailsRoute(
                      images: const [R.accomodationImage, R.gastronomyImage, R.mateImage],
                      likeCount: 350,
                      commentCount: 30,
                      rate: 3.8,
                      viewCount: 14000000,
                      isLiked: false,
                    ),
                  );
                },
                onHeartPressed: () {
                  setState(() {
                    data[index].isLiked = !data[index].isLiked;
                  });
                },
              );
            },
          )),
        ],
      ),
    ));
  }
}
