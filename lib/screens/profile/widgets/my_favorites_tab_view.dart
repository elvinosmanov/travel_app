
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../components/category_card2.dart';
import '../../../data/app_data.dart';
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
          imageUrl: data[index].imageName,
          isLiked: data[index].isLiked,
          location: data[index].place,
          title: data[index].text,
          onHeartPressed: () {
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

