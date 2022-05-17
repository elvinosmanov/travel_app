// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i12;

import '../screens/home/all_categories.dart' as _i1;
import '../screens/home/categories_screen.dart' as _i11;
import '../screens/home/details_screen.dart' as _i2;
import '../screens/home/home_screen.dart' as _i10;
import '../screens/navigation/navigation_screen.dart' as _i5;
import '../screens/onboarding/onboarding_screen.dart' as _i3;
import '../screens/profile/profile_screen.dart' as _i8;
import '../screens/search/search_screen.dart' as _i7;
import '../screens/settings/settings_screen.dart' as _i9;
import '../screens/welcome/welcome_screen.dart' as _i4;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    AllCategoriesRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.AllCategoriesScreen());
    },
    DetailsRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsRouteArgs>();
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.DetailsScreen(
              key: args.key,
              isLiked: args.isLiked,
              images: args.images,
              viewCount: args.viewCount,
              commentCount: args.messageCount,
              likeCount: args.likeCount,
              rate: args.rate));
    },
    OnboardingRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.OnboardingScreen());
    },
    WelcomeRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.WelcomeScreen());
    },
    NavigationRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.NavigationScreen());
    },
    HomeRouter.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    SearchRouter.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.SearchScreen());
    },
    ProfileRouter.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.ProfileScreen());
    },
    SettingsRouter.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.SettingsScreen());
    },
    HomeRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.HomeScreen());
    },
    CategoriesRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.CategoriesScreen());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(AllCategoriesRoute.name, path: 'all_categories'),
        _i6.RouteConfig(DetailsRoute.name, path: 'details'),
        _i6.RouteConfig(OnboardingRoute.name, path: 'onboarding'),
        _i6.RouteConfig(WelcomeRoute.name, path: 'welcome'),
        _i6.RouteConfig(NavigationRoute.name, path: '/', children: [
          _i6.RouteConfig(HomeRouter.name,
              path: 'home',
              parent: NavigationRoute.name,
              children: [
                _i6.RouteConfig(HomeRoute.name,
                    path: '', parent: HomeRouter.name),
                _i6.RouteConfig(CategoriesRoute.name,
                    path: 'categories', parent: HomeRouter.name)
              ]),
          _i6.RouteConfig(SearchRouter.name,
              path: 'search', parent: NavigationRoute.name),
          _i6.RouteConfig(ProfileRouter.name,
              path: 'profile', parent: NavigationRoute.name),
          _i6.RouteConfig(SettingsRouter.name,
              path: 'settings', parent: NavigationRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.AllCategoriesScreen]
class AllCategoriesRoute extends _i6.PageRouteInfo<void> {
  const AllCategoriesRoute()
      : super(AllCategoriesRoute.name, path: 'all_categories');

  static const String name = 'AllCategoriesRoute';
}

/// generated route for
/// [_i2.DetailsScreen]
class DetailsRoute extends _i6.PageRouteInfo<DetailsRouteArgs> {
  DetailsRoute(
      {_i12.Key? key,
      bool isLiked = false,
      required List<String> images,
      required int viewCount,
      required int messageCount,
      required int likeCount,
      required double rate})
      : super(DetailsRoute.name,
            path: 'details',
            args: DetailsRouteArgs(
                key: key,
                isLiked: isLiked,
                images: images,
                viewCount: viewCount,
                messageCount: messageCount,
                likeCount: likeCount,
                rate: rate));

  static const String name = 'DetailsRoute';
}

class DetailsRouteArgs {
  const DetailsRouteArgs(
      {this.key,
      this.isLiked = false,
      required this.images,
      required this.viewCount,
      required this.messageCount,
      required this.likeCount,
      required this.rate});

  final _i12.Key? key;

  final bool isLiked;

  final List<String> images;

  final int viewCount;

  final int messageCount;

  final int likeCount;

  final double rate;

  @override
  String toString() {
    return 'DetailsRouteArgs{key: $key, isLiked: $isLiked, images: $images, viewCount: $viewCount, messageCount: $messageCount, likeCount: $likeCount, rate: $rate}';
  }
}

/// generated route for
/// [_i3.OnboardingScreen]
class OnboardingRoute extends _i6.PageRouteInfo<void> {
  const OnboardingRoute() : super(OnboardingRoute.name, path: 'onboarding');

  static const String name = 'OnboardingRoute';
}

/// generated route for
/// [_i4.WelcomeScreen]
class WelcomeRoute extends _i6.PageRouteInfo<void> {
  const WelcomeRoute() : super(WelcomeRoute.name, path: 'welcome');

  static const String name = 'WelcomeRoute';
}

/// generated route for
/// [_i5.NavigationScreen]
class NavigationRoute extends _i6.PageRouteInfo<void> {
  const NavigationRoute({List<_i6.PageRouteInfo>? children})
      : super(NavigationRoute.name, path: '/', initialChildren: children);

  static const String name = 'NavigationRoute';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class HomeRouter extends _i6.PageRouteInfo<void> {
  const HomeRouter({List<_i6.PageRouteInfo>? children})
      : super(HomeRouter.name, path: 'home', initialChildren: children);

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i7.SearchScreen]
class SearchRouter extends _i6.PageRouteInfo<void> {
  const SearchRouter() : super(SearchRouter.name, path: 'search');

  static const String name = 'SearchRouter';
}

/// generated route for
/// [_i8.ProfileScreen]
class ProfileRouter extends _i6.PageRouteInfo<void> {
  const ProfileRouter() : super(ProfileRouter.name, path: 'profile');

  static const String name = 'ProfileRouter';
}

/// generated route for
/// [_i9.SettingsScreen]
class SettingsRouter extends _i6.PageRouteInfo<void> {
  const SettingsRouter() : super(SettingsRouter.name, path: 'settings');

  static const String name = 'SettingsRouter';
}

/// generated route for
/// [_i10.HomeScreen]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i11.CategoriesScreen]
class CategoriesRoute extends _i6.PageRouteInfo<void> {
  const CategoriesRoute() : super(CategoriesRoute.name, path: 'categories');

  static const String name = 'CategoriesRoute';
}
