
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../components/category_card.dart';
import '../../../data/app_data.dart';

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