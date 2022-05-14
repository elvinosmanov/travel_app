import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:travel_app/cubit/navigation/navigation_cubit.dart';

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
          CustomBottomNavigationIcon(iconName: R.home, index: 0, onTap: () => widget.onItemTapped(0)),
          CustomBottomNavigationIcon(iconName: R.searchDarkGrey, index: 1, onTap: () => widget.onItemTapped(1)),
          CustomBottomNavigationIcon(iconName: R.profile, index: 2, onTap: () => widget.onItemTapped(2)),
          CustomBottomNavigationIcon(iconName: R.settings, index: 3, onTap: () => widget.onItemTapped(3)),
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
    return BlocBuilder<NavigationCubit, NavigationState>(
      buildWhen: (previous, current) => previous.selectedPageIndex != current.selectedPageIndex,
      builder: (context, state) {
        return InkWell(
            splashColor: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            onTap: widget.onTap,
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              height: 60,
              child: state.selectedPageIndex == widget.index
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
      },
    );
  }
}
