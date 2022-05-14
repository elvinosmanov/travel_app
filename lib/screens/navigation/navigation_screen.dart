import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:travel_app/core/cores.dart';
import 'package:travel_app/cubit/navigation/navigation_cubit.dart';
import 'package:travel_app/routes/router.gr.dart';
import 'package:travel_app/screens/home/home_screen.dart';

import '../../components/custom_bottom_navigation.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  // static const List<Widget> _pages = <Widget>[
  // HomeScreen(),
  //   Center(child: Text('Page 2')),
  //   Center(child: Text('Page 3')),
  //   Center(child: Text('Page 4')),
  // ];

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRouter(),
        SearchRouter(),
        ProfileRouter(),
        SearchRouter(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return CustomBottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onItemTapped: tabsRouter.setActiveIndex);
      },
    );
  }

  // final PageStorageBucket bucket = PageStorageBucket();
  // Widget currentScreen = _pages[CustomBottomNavigationBar.selectedIndex];
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: kLightGreyColor_1,
  //     bottomNavigationBar: CustomBottomNavigationBar(onItemTapped: context.read<NavigationCubit>().onItemTapped),
  //     body: SafeArea(
  //         child: Padding(
  //             padding: const EdgeInsets.only(left: 16, right: 16),
  //             child: BlocBuilder<NavigationCubit, NavigationState>(
  //               builder: (context, state) {
  //                 return IndexedStack(
  //                   index: state.selectedPageIndex,
  //                   children: _pages,
  //                 );
  //               },
  //             ))),
  //   );
  // }
}
