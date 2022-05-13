import 'package:flutter/material.dart';

import 'package:travel_app/core/cores.dart';
import 'package:travel_app/screens/home/home_screen.dart';

import '../../components/custom_bottom_navigation.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    Center(child: Text('Page 2')),
    Center(child: Text('Page 3')),
    Center(child: Text('Page 4')),
  ];
  void _onItemTapped(int index) {
    setState(() {
      CustomBottomNavigationBar.selectedIndex = index;
    });
  }

  // final PageStorageBucket bucket = PageStorageBucket();
  // Widget currentScreen = _pages[CustomBottomNavigationBar.selectedIndex];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightGreyColor_1,
      bottomNavigationBar: CustomBottomNavigationBar(
        onItemTapped: (index) {
          _onItemTapped(index);
          // currentScreen = _pages[CustomBottomNavigationBar.selectedIndex];
        },
      ),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: IndexedStack(
                index: CustomBottomNavigationBar.selectedIndex,
                children: _pages,
              ))),
    );
  }
}
