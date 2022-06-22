import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:travel_app/data/app_data.dart';

import '../../../components/category_card2.dart';
import '../../../cubit/place/place_cubit.dart';
import '../../../models/place.dart';
import '../../../routes/router.gr.dart';

class WillVisitTabView extends StatefulWidget {
  const WillVisitTabView({Key? key}) : super(key: key);

  @override
  State<WillVisitTabView> createState() => _WillVisitTabViewState();
}

class _WillVisitTabViewState extends State<WillVisitTabView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlaceCubit()..getAllWillVisitedPlaces(),
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
              return CategoryCard2(
                onPressed: () => context.router.pushNamed('/home/details/${data[index].id}'),
                placeModel: data[index],
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
