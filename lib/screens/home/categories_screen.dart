import 'package:flutter/material.dart';
import 'package:travel_app/components/custom_back_button.dart';
import 'package:travel_app/core/constants.dart';
import 'package:travel_app/extensions/extensions.dart';
import 'package:travel_app/screens/home/home_screen.dart';

import '../../components/category_card.dart';
import '../../core/cores.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key}) : super(key: key);

  final _data = [
    Category('History and Culture', R.mateImage),
    Category('Museum and Art', R.mateImage),
    Category('Accommodation', R.mateImage),
    Category('Shopping', R.mateImage),
    Category('Gastronomy', R.mateImage),
    Category('Nature and Agro', R.mateImage),
    Category('Nature and Agro', R.mateImage),
    Category('Nature and Agro', R.mateImage),
    Category('Nature and Agro', R.mateImage),
    Category('Nature and Agro', R.mateImage),
    Category('Nature and Agro', R.mateImage),
    Category('Nature and Agro', R.mateImage),
    Category('Nature and Agro', R.mateImage),
    Category('Nature and Agro', R.mateImage),
    Category('Nature and Agro', R.mateImage),
    Category('Nature and Agro', R.mateImage),
    Category('Nature and Agro', R.mateImage),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomBackButton(
              onPressed: () => Navigator.maybePop(context),
            ).padding(top: defaultTopPadding, bottom: 32, left: 16),
            'Categories'.heading2().padding(left: 16, bottom: 8),
            CategoryGridView(data: _data),
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
                  textSize: 14,
                  image: _data[index].image,
                  name: _data[index].name,
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
