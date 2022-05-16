import 'package:flutter/material.dart';
import 'package:travel_app/components/custom_back_button.dart';
import 'package:travel_app/components/sort_list.dart';
import 'package:travel_app/core/constants.dart';
import 'package:travel_app/extensions/extensions.dart';
import 'package:travel_app/screens/home/widgets/custom_drop_down_button.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AllCategoriesScreen extends StatefulWidget {
  const AllCategoriesScreen({Key? key}) : super(key: key);

  @override
  State<AllCategoriesScreen> createState() => _AllCategoriesScreenState();
}

class _AllCategoriesScreenState extends State<AllCategoriesScreen> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomBackButton().padding(left: 16, top: 40, bottom: 16),
          CustomDropDownButton(
            selectedValue: selectedValue,
            onChanged: (String? value) {
              setState(() {
                selectedValue = value;
              });
            },
          ).padding(left: 16),
          const SortList(categoryNames: categoriesSorts).padding(top: 16, bottom: 16),
          Expanded(child: StaggeredGridView.),
        ],
      ),
    ));
  }
}
