import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:travel_app/cubit/place/place_cubit.dart';
import 'package:auto_route/auto_route.dart';

import '../../../components/category_card.dart';
import '../../../routes/router.gr.dart';

class RatingsTabView extends StatelessWidget {
  const RatingsTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlaceCubit()..getAllRatedPlaces(),
      child: BlocBuilder<PlaceCubit, PlaceState>(
        builder: (context, state) {
          var data = state.places;
          return AlignedGridView.count(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16),
            crossAxisCount: 3,
            mainAxisSpacing: 16,
            crossAxisSpacing: 8,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return CategoryCard.star(
                onPressed: () => context.router.pushNamed('/home/details/${data[index].id}'),
                textSize: 12,
                starValue: data[index].rateAvgCount,
                image: data[index].imageURLs[0],
                title: data[index].title,
              );
            },
          );
        },
      ),
    );
  }
}
