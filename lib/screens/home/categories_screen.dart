import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/components/custom_back_button.dart';
import 'package:travel_app/core/constants.dart';
import 'package:travel_app/data/app_data.dart';
import 'package:travel_app/extensions/extensions.dart';
import 'package:travel_app/routes/router.gr.dart';

import '../../components/category_card.dart';
import '../../core/cores.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomBackButton(
              onPressed: () => context.router.pop(),
            ).padding(top: defaultTopPadding, left: 16, bottom: 32),
            'Categories'.heading2().padding(left: 16, bottom: 8),
            const CategoryGridView(data: Category.data),
          ],
        ),
      ),
    );
  }
}

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({
    Key? key,
    required List<Category> data,
  })  : _data = data,
        super(key: key);

  final List<Category> _data;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          GridView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 8),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                childAspectRatio: 167 / 130,
                crossAxisSpacing: 8,
                mainAxisSpacing: 20,
              ),
              itemCount: _data.length,
              itemBuilder: (BuildContext ctx, index) {
                return CategoryCard(
                  onPressed: () => context.router.push(AllCategoriesRoute(selectedValue: categoryNames[index + 1])),
                  textSize: 14,
                  image: _data[index].image,
                  title: _data[index].name,
                );
              }),
          Container(
            // margin: const EdgeInsets.only(left: 16, right: 16),
            height: 10,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.3, 1],
                tileMode: TileMode.mirror,
                colors: [kLightGreyColor_1, kLightGreyColor_1.withOpacity(0.05)],
              ),
            ),
          )
        ],
      ),
    );
  }
}
