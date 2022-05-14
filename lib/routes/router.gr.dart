// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i8;

import '../screens/home/categories_screen.dart' as _i7;
import '../screens/home/home_screen.dart' as _i6;
import '../screens/navigation/navigation_screen.dart' as _i1;
import '../screens/profile/profile_screen.dart' as _i4;
import '../screens/search/search_screen.dart' as _i3;
import '../screens/settings/settings_screen.dart' as _i5;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    NavigationScreen.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.NavigationScreen());
    },
    HomeRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    SearchRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SearchScreen());
    },
    ProfileRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.ProfileScreen());
    },
    SettingsRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.SettingsScreen());
    },
    HomeScreen.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.HomeScreen());
    },
    CategoriesScreen.name: (routeData) {
      final args = routeData.argsAs<CategoriesScreenArgs>(
          orElse: () => const CategoriesScreenArgs());
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: _i7.CategoriesScreen(key: args.key));
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(NavigationScreen.name, path: '/', children: [
          _i2.RouteConfig(HomeRouter.name,
              path: 'home',
              parent: NavigationScreen.name,
              children: [
                _i2.RouteConfig(HomeScreen.name,
                    path: '', parent: HomeRouter.name),
                _i2.RouteConfig(CategoriesScreen.name,
                    path: 'categories', parent: HomeRouter.name)
              ]),
          _i2.RouteConfig(SearchRouter.name,
              path: 'search', parent: NavigationScreen.name),
          _i2.RouteConfig(ProfileRouter.name,
              path: 'profile', parent: NavigationScreen.name),
          _i2.RouteConfig(SettingsRouter.name,
              path: 'settings', parent: NavigationScreen.name)
        ])
      ];
}

/// generated route for
/// [_i1.NavigationScreen]
class NavigationScreen extends _i2.PageRouteInfo<void> {
  const NavigationScreen({List<_i2.PageRouteInfo>? children})
      : super(NavigationScreen.name, path: '/', initialChildren: children);

  static const String name = 'NavigationScreen';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class HomeRouter extends _i2.PageRouteInfo<void> {
  const HomeRouter({List<_i2.PageRouteInfo>? children})
      : super(HomeRouter.name, path: 'home', initialChildren: children);

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i3.SearchScreen]
class SearchRouter extends _i2.PageRouteInfo<void> {
  const SearchRouter() : super(SearchRouter.name, path: 'search');

  static const String name = 'SearchRouter';
}

/// generated route for
/// [_i4.ProfileScreen]
class ProfileRouter extends _i2.PageRouteInfo<void> {
  const ProfileRouter() : super(ProfileRouter.name, path: 'profile');

  static const String name = 'ProfileRouter';
}

/// generated route for
/// [_i5.SettingsScreen]
class SettingsRouter extends _i2.PageRouteInfo<void> {
  const SettingsRouter() : super(SettingsRouter.name, path: 'settings');

  static const String name = 'SettingsRouter';
}

/// generated route for
/// [_i6.HomeScreen]
class HomeScreen extends _i2.PageRouteInfo<void> {
  const HomeScreen() : super(HomeScreen.name, path: '');

  static const String name = 'HomeScreen';
}

/// generated route for
/// [_i7.CategoriesScreen]
class CategoriesScreen extends _i2.PageRouteInfo<CategoriesScreenArgs> {
  CategoriesScreen({_i8.Key? key})
      : super(CategoriesScreen.name,
            path: 'categories', args: CategoriesScreenArgs(key: key));

  static const String name = 'CategoriesScreen';
}

class CategoriesScreenArgs {
  const CategoriesScreenArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'CategoriesScreenArgs{key: $key}';
  }
}
