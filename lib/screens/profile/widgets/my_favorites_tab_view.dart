import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:travel_app/cubit/like/like_cubit.dart';
import 'package:travel_app/cubit/place/place_cubit.dart';

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
      create: (context) => PlaceCubit(),
      child: BlocBuilder<LikeCubit, LikeState>(
        buildWhen: (previous, current) => previous.likeList != current.likeList,
        builder: (context, likeState) {
          for (var a in likeState.likeList) {
            print(a.placeId);
          }
          if (likeState.likeList.isNotEmpty) {
            context.read<PlaceCubit>().getAllLikedPlaces(likeState.likeList);

            return BlocBuilder<PlaceCubit, PlaceState>(
              buildWhen: (previous, current) => previous.places != current.places,
              builder: (context, state) {
                var data = state.places;
                print('dataLengtj: //${data.length}');
                return AlignedGridView.count(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(16),
                  crossAxisCount: 3,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 8,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return CategoryCard2(
                      placeModel: data[index],
                      textSize: 14,
                      placeSize: 10,
                      height: 160,
                    );
                  },
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
