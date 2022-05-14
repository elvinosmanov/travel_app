import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/core/cores.dart';
import 'package:travel_app/cubit/navigation/navigation_cubit.dart';

import 'custom_textfield.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<NavigationCubit>().onItemTapped(1);
      },
      child: CustomTextField(
        controller: TextEditingController(),
        filled: true,
        hintText: 'Search for places...',
        contentPadding: const EdgeInsets.only(left: 20, right: 16, top: 16, bottom: 20),
        enabled: false,
        suffixIcon: InkWell(
          onTap: () {
            print('search button pressed');
          },
          child: SizedBox(
            width: 32,
            height: 32,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: kBlueColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [kBlueBoxShadow],
                ),
                child: SvgPicture.asset(
                  R.search,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
