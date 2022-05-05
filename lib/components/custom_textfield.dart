import 'package:flutter/material.dart';

import 'package:travel_app/core/colors.dart';
import 'package:travel_app/extensions.dart/extensions.dart';
import 'package:travel_app/core/styles.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final bool isMandatory;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? obscureText;
  final int? maxLines;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final Widget? suffixIcon;
  final Widget? suffix;
  final void Function()? onEditingComplete;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  const CustomTextField({
    Key? key,
    this.label,
    this.isMandatory = false,
    this.controller,
    this.focusNode,
    this.obscureText,
    this.maxLines,
    this.keyboardType,
    this.onChanged,
    this.onSubmitted,
    this.suffixIcon,
    this.suffix,
    this.onEditingComplete,
    this.textInputAction,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: kMediumTextStyle(15),
      controller: controller,
      focusNode: focusNode,
      
      obscureText: obscureText ?? false,
      maxLines: maxLines,
      keyboardType: keyboardType,
      textInputAction: textInputAction ?? TextInputAction.next,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      validator: validator,
      // onSubmitted: onSubmitted,
      onEditingComplete: onEditingComplete,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        suffix: suffix,
        isCollapsed: true,
        label: isMandatory
            ? Text.rich(TextSpan(
                text: label,
                style: kRegularTextStyle(15, kDarkGreyColor),
                children: [TextSpan(text: ' *', style: kRegularTextStyle(15, kRedColor))]))
            : label.regularTextStyle(15, kDarkGreyColor),
        contentPadding: const EdgeInsets.all(16),
        enabledBorder: OutlineInputBorder(
          borderRadius: kRadius16,
          borderSide: const BorderSide(
            color: kLightGreyColor_4,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: kRadius16,
          borderSide: const BorderSide(
            color: kBlueColor,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: kRadius16,
          borderSide: const BorderSide(
            color: kRedColor,
            width: 1,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: kRadius16,
          borderSide: const BorderSide(
            color: kLightGreyColor_4,
            width: 1,
          ),
        ),
      ),
    );
  }
}
