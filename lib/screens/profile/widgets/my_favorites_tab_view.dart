import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:travel_app/cubit/place/place_cubit.dart';
import 'package:travel_app/models/place.dart';

import '../../../components/category_card2.dart';

class MyFavoritesTabView extends StatefulWidget {
  const MyFavoritesTabView({Key? key}) : super(key: key);

  @override
  State<MyFavoritesTabView> createState() => _MyFavoritesTabViewState();
}

class _MyFavoritesTabViewState extends State<MyFavoritesTabView> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlaceCubit()..getPlaceById(placeId),
      child: BlocBuilder<PlaceCubit, PlaceState>(
        builder: (context, state) {
          return AlignedGridView.count(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16),
            crossAxisCount: 3,
            mainAxisSpacing: 16,
            crossAxisSpacing: 8,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return CategoryCard2(
                placeModel: PlaceModel(
                    id: '',
                    categories: [],
                    title: '',
                    description: '',
                    locationName: '',
                    imageURLs: [],
                    location: const GeoPoint(41, 41),
                    commentCount: 0,
                    likeCount: 0,
                    viewCount: 0,
                    rateAvgCount: 1.0,
                    createdDate: DateTime.now()),
                textSize: 14,
                placeSize: 10,
                height: 160,
              );
            },
          );
        },
      ),
    );
  }
}
