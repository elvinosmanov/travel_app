// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i11;

import '../screens/home/all_categories.dart' as _i1;
import '../screens/home/categories_screen.dart' as _i10;
import '../screens/home/home_screen.dart' as _i9;
import '../screens/navigation/navigation_screen.dart' as _i4;
import '../screens/onboarding/onboarding_screen.dart' as _i2;
import '../screens/profile/profile_screen.dart' as _i7;
import '../screens/search/search_screen.dart' as _i6;
import '../screens/settings/settings_screen.dart' as _i8;
import '../screens/welcome/welcome_screen.dart' as _i3;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    AllCategoriesRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.AllCategoriesScreen());
    },
    OnboardingRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.OnboardingScreen());
    },
    WelcomeRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.WelcomeScreen());
    },
    NavigationRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.NavigationScreen());
    },
    HomeRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.EmptyRouterPage());
    },
    SearchRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.SearchScreen());
    },
    ProfileRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.ProfileScreen());
    },
    SettingsRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.SettingsScreen());
    },
    HomeRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.HomeScreen());
    },
    CategoriesRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.CategoriesScreen());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(AllCategoriesRoute.name, path: 'all_categories'),
        _i5.RouteConfig(OnboardingRoute.name, path: 'onboarding'),
        _i5.RouteConfig(WelcomeRoute.name, path: 'welcome'),
        _i5.RouteConfig(NavigationRoute.name, path: '/', children: [
          _i5.RouteConfig(HomeRouter.name,
              path: 'home',
              parent: NavigationRoute.name,
              children: [
                _i5.RouteConfig(HomeRoute.name,
                    path: '', parent: HomeRouter.name),
                _i5.RouteConfig(CategoriesRoute.name,
                    path: 'categories', parent: HomeRouter.name)
              ]),
          _i5.RouteConfig(SearchRouter.name,
              path: 'search', parent: NavigationRoute.name),
          _i5.RouteConfig(ProfileRouter.name,
              path: 'profile', parent: NavigationRoute.name),
          _i5.RouteConfig(SettingsRouter.name,
              path: 'settings', parent: NavigationRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.AllCategoriesScreen]
class AllCategoriesRoute extends _i5.PageRouteInfo<void> {
  const AllCategoriesRoute()
      : super(AllCategoriesRoute.name, path: 'all_categories');

  static const String name = 'AllCategoriesRoute';
}

/// generated route for
/// [_i2.OnboardingScreen]
class OnboardingRoute extends _i5.PageRouteInfo<void> {
  const OnboardingRoute() : super(OnboardingRoute.name, path: 'onboarding');

  static const String name = 'OnboardingRoute';
}

/// generated route for
/// [_i3.WelcomeScreen]
class WelcomeRoute extends _i5.PageRouteInfo<void> {
  const WelcomeRoute() : super(WelcomeRoute.name, path: 'welcome');

  static const String name = 'WelcomeRoute';
}

/// generated route for
/// [_i4.NavigationScreen]
class NavigationRoute extends _i5.PageRouteInfo<void> {
  const NavigationRoute({List<_i5.PageRouteInfo>? children})
      : super(NavigationRoute.name, path: '/', initialChildren: children);

  static const String name = 'NavigationRoute';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class HomeRouter extends _i5.PageRouteInfo<void> {
  const HomeRouter({List<_i5.PageRouteInfo>? children})
      : super(HomeRouter.name, path: 'home', initialChildren: children);

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i6.SearchScreen]
class SearchRouter extends _i5.PageRouteInfo<void> {
  const SearchRouter() : super(SearchRouter.name, path: 'search');

  static const String name = 'SearchRouter';
}

/// generated route for
/// [_i7.ProfileScreen]
class ProfileRouter extends _i5.PageRouteInfo<void> {
  const ProfileRouter() : super(ProfileRouter.name, path: 'profile');

  static const String name = 'ProfileRouter';
}

/// generated route for
/// [_i8.SettingsScreen]
class SettingsRouter extends _i5.PageRouteInfo<void> {
  const SettingsRouter() : super(SettingsRouter.name, path: 'settings');

  static const String name = 'SettingsRouter';
}

/// generated route for
/// [_i9.HomeScreen]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i10.CategoriesScreen]
class CategoriesRoute extends _i5.PageRouteInfo<void> {
  const CategoriesRoute() : super(CategoriesRoute.name, path: 'categories');

  static const String name = 'CategoriesRoute';
}
