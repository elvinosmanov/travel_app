import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/cores.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    Key? key,
    required this.onItemTapped,
    required this.currentIndex,
  }) : super(key: key);

  final Function(int index) onItemTapped;
  final int currentIndex;
  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: kDarkGreyColor.withOpacity(0.4),
            offset: const Offset(0.0, -1.0), //(x,y)
            blurRadius: 2.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          CustomBottomNavigationIcon(
              iconName: R.home, isActive: 0 == widget.currentIndex, onTap: () => widget.onItemTapped(0)),
          CustomBottomNavigationIcon(
              iconName: R.searchDarkGrey, isActive: 1 == widget.currentIndex, onTap: () => widget.onItemTapped(1)),
          CustomBottomNavigationIcon(
              iconName: R.profile, isActive: 2 == widget.currentIndex, onTap: () => widget.onItemTapped(2)),
          CustomBottomNavigationIcon(
              iconName: R.settings, isActive: 3 == widget.currentIndex, onTap: () => widget.onItemTapped(3)),
        ],
      ),
    );
  }
}

class CustomBottomNavigationIcon extends StatelessWidget {
  const CustomBottomNavigationIcon({
    Key? key,
    required this.iconName,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);
  final String iconName;
  final bool isActive;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 4,
          height: 55,
          child: isActive
              ? Align(
                  alignment: Alignment.center,
                  child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kNavigationBlueColor,
                        boxShadow: [kNavigationBarShadow],
                      ),
                      child: SvgPicture.asset(
                        iconName,
                        color: kBlueColor,
                        fit: BoxFit.scaleDown,
                      )),
                )
              : SvgPicture.asset(
                  iconName,
                  color: kDarkGreyColor,
                  fit: BoxFit.scaleDown,
                ),
        ));
  }
}
