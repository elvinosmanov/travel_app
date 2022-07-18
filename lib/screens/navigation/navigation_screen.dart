import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/routes/router.gr.dart';

import '../../components/custom_bottom_navigation.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);


  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  
  
  final List<PageRouteInfo> routes = const [
    HomeRouter(),
    SearchRouter(),
    ProfileRouter(),
    SettingsRouter(),
  ];
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      builder: (context, child, animation) {
        return SafeArea(
          child: child,
        );
      },
      routes: routes,
      bottomNavigationBuilder: (_, tabsRouter) {
        return CustomBottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onItemTapped: (value) {
              if (value == tabsRouter.activeIndex) {
                tabsRouter.navigateNamed(routes[value].path);
              } else {
                tabsRouter.setActiveIndex(value);
              }
            });
      },
    );
  }
}
