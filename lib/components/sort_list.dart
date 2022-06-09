import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:travel_app/core/cores.dart';
import 'package:travel_app/cubit/place/place_cubit.dart';
import 'package:travel_app/extensions/extensions.dart';

///There is padding top and bottom 8px
class SortList extends StatefulWidget {
  const SortList({
    Key? key,
    this.onPressed,
    this.controller,
  }) : super(key: key);
  final Function(int value)? onPressed;
  final ScrollController? controller;
  @override
  State<SortList> createState() => _SortListState();
}

class _SortListState extends State<SortList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: BlocBuilder<PlaceCubit, PlaceState>(
        buildWhen: (previous, current) => previous.sortedValue != current.sortedValue,
        builder: (context, state) {
          return ListView.builder(
            controller: widget.controller,
            padding: const EdgeInsets.only(left: 16.0),
            scrollDirection: Axis.horizontal,
            itemCount: PlaceSorts.values.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return FilterItem(
                  isActive: state.sortedValue == PlaceSorts.values[index],
                  itemName: PlaceSorts.values[index].toString(),
                  onPressed: () {
                    context.read<PlaceCubit>().getAllPlacesBy(PlaceSorts.values[index]);
                  }).padding(right: 10);
            },
          );
        },
      ),
    );
  }
}

class FilterItem extends StatelessWidget {
  const FilterItem({
    Key? key,
    this.isActive = false,
    required this.itemName,
    required this.onPressed,
  }) : super(key: key);
  final bool isActive;
  final String itemName;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: kRadius8,
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          itemName.semiBoldTextStyle(15, isActive ? kBlueColor : kDarkGreyColor),
          if (isActive)
            Container(
              width: 6,
              height: 6,
              margin: const EdgeInsets.only(top: 6),
              decoration: const BoxDecoration(color: kBlueColor, shape: BoxShape.circle),
            )
        ],
      ).padding(all: 8),
    );
  }
}
