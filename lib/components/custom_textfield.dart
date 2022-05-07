import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/core/R.dart';

import 'package:travel_app/core/colors.dart';
import 'package:travel_app/core/styles.dart';
import 'package:travel_app/extensions/extensions.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  final String? label;
  final bool isMandatory;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final bool? obscureText;
  final int? maxLines;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final Widget? suffixIcon;
  final Widget? suffix;
  final Widget? prefix;
  final void Function()? onEditingComplete;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  const CustomTextField({
    Key? key,
    this.label,
    this.isMandatory = false,
    required this.controller,
    this.focusNode,
    this.obscureText,
    this.maxLines,
    this.keyboardType,
    this.onChanged,
    this.onSubmitted,
    this.suffixIcon,
    this.suffix,
    this.prefix,
    this.onEditingComplete,
    this.textInputAction,
    this.validator,
    this.inputFormatters,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: kRegularTextStyle(15),
      controller: widget.controller,
      focusNode: widget.focusNode,
      inputFormatters: widget.inputFormatters,
      obscureText: widget.obscureText ?? false,
      maxLines: widget.obscureText ?? false ? 1 : widget.maxLines,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction ?? TextInputAction.next,
      onChanged: (value) {
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
      onFieldSubmitted: widget.onSubmitted,
      validator: widget.validator,
      onEditingComplete: widget.onEditingComplete,
      decoration: InputDecoration(
        errorStyle: kRegularTextStyle(11, kRedColor),
        errorMaxLines: 3,
        prefix: widget.prefix,
        suffixIcon: widget.suffixIcon,
        suffix: widget.suffix,
        isCollapsed: true,
        label: widget.isMandatory
            ? Text.rich(TextSpan(
                text: widget.label,
                style: kRegularTextStyle(15, kDarkGreyColor),
                children: [TextSpan(text: ' *', style: kRegularTextStyle(15, kRedColor))]))
            : widget.label.regularTextStyle(15, kDarkGreyColor),
        contentPadding: const EdgeInsets.all(16),
        enabledBorder: OutlineInputBorder(
          borderRadius: kRadius16,
          borderSide: const BorderSide(
            color: kLightGreyColor_4,
            width: 0.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: kRadius16,
          borderSide: const BorderSide(
            color: kBlueColor,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: kRadius16,
          borderSide: const BorderSide(
            color: kRedColor,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: kRadius16,
          borderSide: const BorderSide(
            color: kRedColor,
            width: 0.5,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: kRadius16,
          borderSide: const BorderSide(
            color: kLightGreyColor_4,
            width: 0.5,
          ),
        ),
      ),
    );
  }
}
