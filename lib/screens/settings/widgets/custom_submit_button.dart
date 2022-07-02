import 'package:flutter/material.dart';

import 'package:travel_app/core/cores.dart';
import 'package:travel_app/extensions/text_style_extension.dart';

class CustomSubmitButton extends StatelessWidget {
  const CustomSubmitButton({
    Key? key,
    this.onPressed,
    required this.text,
    required this.textColor,
    this.backgroundColor,
    this.isLoading = false,
  }) : super(key: key);
  final void Function()? onPressed;
  final String text;
  final Color textColor;
  final Color? backgroundColor;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(2),
            overlayColor: MaterialStateProperty.all(Colors.black12),
            padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 14, horizontal: 10)),
            backgroundColor: MaterialStateProperty.all(backgroundColor ?? kGreenColor),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: kRadius8)),
          ),
          onPressed: isLoading ? null : onPressed,
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : text.mediumTextStyle(14, textColor)),
    );
  }
}
