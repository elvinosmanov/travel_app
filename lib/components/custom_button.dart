import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/core/colors.dart';

import 'package:travel_app/core/styles.dart';

class CustomButton extends StatelessWidget {
  final double? horizontalPadding;
  final double? verticalPadding;
  final String? iconName;
  final Text? text;
  final Color color;
  final VoidCallback? onPressed;
  final bool isLoading;
  const CustomButton({
    Key? key,
    this.horizontalPadding,
    this.verticalPadding,
    this.iconName,
    this.text,
    required this.color,
    this.onPressed,
    this.isLoading = false,
  }) : super(key: key);

  const CustomButton.text({
    this.horizontalPadding,
    this.verticalPadding,
    required this.text,
    required this.color,
    this.onPressed,
    this.isLoading = false,
    Key? key,
  })  : iconName = null,
        super(key: key);
  const CustomButton.iconName({
    this.horizontalPadding,
    this.verticalPadding,
    required this.color,
    required this.iconName,
    this.isLoading = false,
    this.onPressed,
    key,
  })  : text = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Ink(
        decoration: BoxDecoration(color: color, borderRadius: kRadius16),
        child: InkWell(
          onTap: onPressed,
          splashColor: Colors.white30,
          borderRadius: kRadius16,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: verticalPadding ?? 16, horizontal: horizontalPadding ?? 0),
            child: isLoading
                ? const Center(
                    child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: kWhiteColor,
                          strokeWidth: 2,
                        )),
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      iconName != null
                          ? SvgPicture.asset(
                              iconName!,
                            )
                          : const SizedBox.shrink(),
                      if (iconName != null && text != null) const SizedBox(width: 16.0),
                      text != null ? text! : const SizedBox.shrink(),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
