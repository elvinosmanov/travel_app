import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  final bool? filled;
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
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? hintStyle;
  final String? hintText;
  final Function()? onTap;

  final bool? enabled;

  const CustomTextField({
    Key? key,
    this.label,
    this.isMandatory = false,
    required this.controller,
    this.focusNode,
    this.obscureText,
    this.filled,
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
    this.contentPadding,
    this.hintStyle,
    this.hintText,
    this.onTap,
    this.enabled,
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
      enabled: widget.enabled,
      maxLines: widget.obscureText ?? false ? 1 : widget.maxLines,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction ?? TextInputAction.next,
      onTap: widget.onTap,
      onChanged: (value) {
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
      onFieldSubmitted: widget.onSubmitted,
      validator: widget.validator,
      onEditingComplete: widget.onEditingComplete,
      decoration: InputDecoration(
          fillColor: kLightGreyColor_2,
          filled: widget.filled ?? false,
          errorStyle: kRegularTextStyle(11, kRedColor),
          errorMaxLines: 3,
          prefix: widget.prefix,
          suffixIcon: widget.suffixIcon,
          suffix: widget.suffix,
          isCollapsed: true,
          hintText: widget.hintText,
          hintStyle: widget.hintStyle ?? kSemiBoldTextStyle(15, kLightGreyColor_5),
          label: widget.label != null
              ? widget.isMandatory
                  ? Text.rich(TextSpan(
                      text: widget.label,
                      style: kRegularTextStyle(15, kDarkGreyColor),
                      children: [TextSpan(text: ' *', style: kRegularTextStyle(15, kRedColor))]))
                  : widget.label.regularTextStyle(15, kDarkGreyColor)
              : null,
          contentPadding: widget.contentPadding ?? const EdgeInsets.all(16),
          enabledBorder: customOutlineInputBorder(color: kLightGreyColor_4, width: 0.5),
          focusedBorder: customOutlineInputBorder(color: kBlueColor, width: 1),
          focusedErrorBorder: customOutlineInputBorder(color: kRedColor, width: 1),
          errorBorder: customOutlineInputBorder(color: kRedColor, width: 0.5),
          border: customOutlineInputBorder(color: kLightGreyColor_4, width: 0.5)),
    );
  }

  OutlineInputBorder customOutlineInputBorder({required Color color, required double width}) {
    return OutlineInputBorder(
      borderRadius: kRadius16,
      borderSide: BorderSide(
        color: color,
        width: width,
      ),
    );
  }
}
