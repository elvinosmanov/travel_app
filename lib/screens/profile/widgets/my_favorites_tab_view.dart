import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:travel_app/cubit/place/place_cubit.dart';
import 'package:travel_app/routes/router.gr.dart';

import '../../../bloc/auth/auth_bloc.dart';
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
    final user = context.watch<AuthBloc>().state.user;
    return BlocProvider(
        create: (context) => PlaceCubit()..getAllLikedPlaces(user!.id!),
        child: BlocBuilder<PlaceCubit, PlaceState>(
          builder: (context, state) {
            var data = state.places;
            return AlignedGridView.count(
              padding: const EdgeInsets.all(16),
              crossAxisCount: 3,
              mainAxisSpacing: 16,
              crossAxisSpacing: 8,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return CategoryCard2(
                  onPressed: () {
                    final router = AutoRouterDelegate.of(context);
                    router.controller.navigateNamed('/home/details/${data[index].id}');
                  },
                  hasHeartIcon: false,
                  placeModel: data[index],
                  textSize: 14,
                  placeSize: 10,
                  height: 160,
                );
              },
            );
          },
        ));
  }
}
