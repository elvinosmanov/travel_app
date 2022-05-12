import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/screens/main/main_screen.dart';

import '../core/cores.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);
  static const List<Widget> _pages = <Widget>[];
  static int _selectedIndex = 0;
  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  void _onItemTapped(int index) {
    setState(() {
      CustomBottomNavigationBar._selectedIndex = index;
    });
  }

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
          CustomBottomNavigationIcon(iconName: R.home, index: 0, onTap: () => _onItemTapped(0)),
          CustomBottomNavigationIcon(iconName: R.searchDarkGrey, index: 1, onTap: () => _onItemTapped(1)),
          CustomBottomNavigationIcon(iconName: R.profile, index: 2, onTap: () => _onItemTapped(2)),
          CustomBottomNavigationIcon(iconName: R.settings, index: 3, onTap: () => _onItemTapped(3)),
        ],
      ),
    );
  }
}

class CustomBottomNavigationIcon extends StatefulWidget {
  const CustomBottomNavigationIcon({
    Key? key,
    required this.iconName,
    required this.index,
    required this.onTap,
  }) : super(key: key);
  final String iconName;
  final int index;
  final void Function() onTap;
  @override
  State<CustomBottomNavigationIcon> createState() => _CustomBottomNavigationIconState();
}

class _CustomBottomNavigationIconState extends State<CustomBottomNavigationIcon> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        onTap: widget.onTap,
        child: SizedBox(
          width: 70,
          height: 60,
          child: CustomBottomNavigationBar._selectedIndex == widget.index
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
                        widget.iconName,
                        color: kBlueColor,
                        fit: BoxFit.scaleDown,
                      )),
                )
              : SvgPicture.asset(
                  widget.iconName,
                  color: kDarkGreyColor,
                  fit: BoxFit.scaleDown,
                ),
        ));
  }
}
