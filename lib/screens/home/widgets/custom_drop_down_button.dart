import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:travel_app/core/constants.dart';
import 'package:travel_app/core/cores.dart';
import 'package:travel_app/extensions/extensions.dart';
class CustomDropDownButton extends StatefulWidget {
  final String? selectedValue;
  final Function(String?)? onChanged;
  const CustomDropDownButton({
    Key? key,
    required this.selectedValue,
    this.onChanged,
  }) : super(key: key);

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  bool isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        value: widget.selectedValue,
        isExpanded: true,
        items: categoryNames
            .map((item) => DropdownMenuItem<String>(value: item, child: item.semiBoldTextStyle(13)))
            .toList(),
        onChanged: widget.onChanged,
        onMenuStateChange: (value) {
          setState(() {
            isMenuOpen = value;
          });
        },
        hint: Row(children: [Expanded(child: 'Categories'.mediumTextStyle(16, kDarkGreyColor))]),
        icon: SvgPicture.asset(isMenuOpen ? R.upArrow : R.downArrow, fit: BoxFit.scaleDown),
        buttonHeight: 40,
        buttonWidth: 200,
        buttonPadding: const EdgeInsets.only(left: 16, right: 16),
        buttonDecoration: BoxDecoration(
            borderRadius: kRadius8, border: Border.all(color: kBlackColor.withOpacity(0.1)), color: kLightGreyColor_2),
        dropdownMaxHeight: 200,
        dropdownWidth: 200,
        dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
        dropdownDecoration: BoxDecoration(
          borderRadius: kRadius8,
          border: Border.all(color: kBlackColor.withOpacity(0.1)),
          color: kWhiteColor,
        ),
        dropdownElevation: 0,
        itemHeight: 30,
        itemPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        scrollbarRadius: const Radius.circular(40),
        scrollbarThickness: 3,
        scrollbarAlwaysShow: true,
      ),
    );
  }
}
