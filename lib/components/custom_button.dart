import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/core/styles.dart';

class CustomButton extends StatelessWidget {
  final double? horizontalPadding;
  final double? verticalPadding;
  final String? iconName;
  final Text? text;
  final Color color;
  final VoidCallback? onPressed;
  const CustomButton({
    Key? key,
    this.horizontalPadding,
    this.verticalPadding,
    required this.iconName,
    required this.text,
    required this.color,
    this.onPressed,
  }) : super(key: key);

  const CustomButton.text({
    this.horizontalPadding,
    this.verticalPadding,
    required this.text,
    required this.color,
    this.onPressed,
    Key? key,
  })  : iconName = null,
        super(key: key);
  const CustomButton.iconName({
    this.horizontalPadding,
    this.verticalPadding,
    required this.color,
    required this.iconName,
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
            child: Row(
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
