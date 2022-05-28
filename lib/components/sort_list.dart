import 'package:flutter/material.dart';

import 'package:travel_app/core/cores.dart';
import 'package:travel_app/extensions/extensions.dart';

///There is padding top and bottom 8px
class SortList extends StatefulWidget {
  const SortList({
    Key? key,
    this.onPressed,
    required this.categoryNames,
    required this.initialValue,
    this.onChanged,
    this.controller,
  }) : super(key: key);
  final Function(int value)? onPressed;
  final List<String> categoryNames;
  final int initialValue;
  final Function(int value)? onChanged;
  final ScrollController? controller;
  @override
  State<SortList> createState() => _SortListState();
}

class _SortListState extends State<SortList> {
  late int _selectedIndex;
  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: ListView.builder(
        controller: widget.controller,
        padding: const EdgeInsets.only(left: 16.0),
        scrollDirection: Axis.horizontal,
        itemCount: widget.categoryNames.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return FilterItem(
              isActive: _selectedIndex == index,
              itemName: widget.categoryNames[index],
              onPressed: () {
                if (widget.onChanged != null) {
                  widget.onChanged!(index);
                }
                setState(() {
                  _selectedIndex = index;
                });
              });
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
    return GestureDetector(
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
      ).padding(right: 24, top: 8, bottom: 8),
    );
  }
}
