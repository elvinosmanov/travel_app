// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i19;

import '../screens/home/all_categories.dart' as _i9;
import '../screens/home/categories_screen.dart' as _i8;
import '../screens/home/home_screen.dart' as _i7;
import '../screens/navigation/navigation_screen.dart' as _i3;
import '../screens/onboarding/onboarding_screen.dart' as _i1;
import '../screens/profile/profile_screen.dart' as _i6;
import '../screens/profile/widgets/my_favorites_tab_view.dart' as _i10;
import '../screens/profile/widgets/ratings_tab_view.dart' as _i11;
import '../screens/profile/widgets/will_visit_tab_view.dart' as _i12;
import '../screens/search/search_screen.dart' as _i5;
import '../screens/settings/change_password_screen.dart' as _i17;
import '../screens/settings/languages_screen.dart' as _i15;
import '../screens/settings/personal_informations_screen.dart' as _i14;
import '../screens/settings/privacy_policy_screen.dart' as _i18;
import '../screens/settings/report_bug_screen.dart' as _i16;
import '../screens/settings/settings_screen.dart' as _i13;
import '../screens/welcome/welcome_screen.dart' as _i2;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i19.GlobalKey<_i19.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    OnboardingRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.OnboardingScreen());
    },
    WelcomeRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.WelcomeScreen());
    },
    NavigationRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.NavigationScreen());
    },
    HomeRouter.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.EmptyRouterPage());
    },
    SearchRouter.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.SearchScreen());
    },
    ProfileRouter.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.ProfileScreen());
    },
    SettingsRouter.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.EmptyRouterPage());
    },
    HomeRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.HomeScreen());
    },
    CategoriesRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.CategoriesScreen());
    },
    AllCategoriesRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<AllCategoriesRouteArgs>(
          orElse: () => AllCategoriesRouteArgs(
              selectedValue: pathParams.optString('id'),
              initialSortValue: pathParams.optInt('sortId')));
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.AllCategoriesScreen(
              key: args.key,
              selectedValue: args.selectedValue,
              initialSortValue: args.initialSortValue));
    },
    SearchRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.SearchScreen());
    },
    MyFavoritesTab.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.MyFavoritesTabView());
    },
    RatingsTab.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.RatingsTabView());
    },
    WillVisitTab.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.WillVisitTabView());
    },
    SettingsRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.SettingsScreen());
    },
    PersonalInformationsRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.PersonalInformationsScreen());
    },
    LanguagesRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.LanguagesScreen());
    },
    ReportBugRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i16.ReportBugScreen());
    },
    ChangePasswordRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i17.ChangePasswordScreen());
    },
    PrivacyPolicyRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i18.PrivacyPolicyScreen());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(OnboardingRoute.name, path: 'onboarding'),
        _i4.RouteConfig(WelcomeRoute.name, path: 'welcome'),
        _i4.RouteConfig(NavigationRoute.name, path: '/', children: [
          _i4.RouteConfig(HomeRouter.name,
              path: 'home',
              parent: NavigationRoute.name,
              children: [
                _i4.RouteConfig(HomeRoute.name,
                    path: '', parent: HomeRouter.name),
                _i4.RouteConfig(CategoriesRoute.name,
                    path: 'categories', parent: HomeRouter.name),
                _i4.RouteConfig(AllCategoriesRoute.name,
                    path: 'all-categories/:id/:sortId',
                    parent: HomeRouter.name),
                _i4.RouteConfig(SearchRoute.name,
                    path: 'search', parent: HomeRouter.name)
              ]),
          _i4.RouteConfig(SearchRouter.name,
              path: 'search', parent: NavigationRoute.name),
          _i4.RouteConfig(ProfileRouter.name,
              path: 'profile',
              parent: NavigationRoute.name,
              children: [
                _i4.RouteConfig(MyFavoritesTab.name,
                    path: 'my-favorites', parent: ProfileRouter.name),
                _i4.RouteConfig(RatingsTab.name,
                    path: 'ratings', parent: ProfileRouter.name),
                _i4.RouteConfig(WillVisitTab.name,
                    path: 'will-visit', parent: ProfileRouter.name)
              ]),
          _i4.RouteConfig(SettingsRouter.name,
              path: 'settings',
              parent: NavigationRoute.name,
              children: [
                _i4.RouteConfig(SettingsRoute.name,
                    path: '', parent: SettingsRouter.name),
                _i4.RouteConfig(PersonalInformationsRoute.name,
                    path: 'personal-informations', parent: SettingsRouter.name),
                _i4.RouteConfig(LanguagesRoute.name,
                    path: 'languages', parent: SettingsRouter.name),
                _i4.RouteConfig(ReportBugRoute.name,
                    path: 'report-a-bug', parent: SettingsRouter.name),
                _i4.RouteConfig(ChangePasswordRoute.name,
                    path: 'change-password', parent: SettingsRouter.name),
                _i4.RouteConfig(PrivacyPolicyRoute.name,
                    path: 'privacy-policy', parent: SettingsRouter.name)
              ])
        ])
      ];
}

/// generated route for
/// [_i1.OnboardingScreen]
class OnboardingRoute extends _i4.PageRouteInfo<void> {
  const OnboardingRoute() : super(OnboardingRoute.name, path: 'onboarding');

  static const String name = 'OnboardingRoute';
}

/// generated route for
/// [_i2.WelcomeScreen]
class WelcomeRoute extends _i4.PageRouteInfo<void> {
  const WelcomeRoute() : super(WelcomeRoute.name, path: 'welcome');

  static const String name = 'WelcomeRoute';
}

/// generated route for
/// [_i3.NavigationScreen]
class NavigationRoute extends _i4.PageRouteInfo<void> {
  const NavigationRoute({List<_i4.PageRouteInfo>? children})
      : super(NavigationRoute.name, path: '/', initialChildren: children);

  static const String name = 'NavigationRoute';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class HomeRouter extends _i4.PageRouteInfo<void> {
  const HomeRouter({List<_i4.PageRouteInfo>? children})
      : super(HomeRouter.name, path: 'home', initialChildren: children);

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i5.SearchScreen]
class SearchRouter extends _i4.PageRouteInfo<void> {
  const SearchRouter() : super(SearchRouter.name, path: 'search');

  static const String name = 'SearchRouter';
}

/// generated route for
/// [_i6.ProfileScreen]
class ProfileRouter extends _i4.PageRouteInfo<void> {
  const ProfileRouter({List<_i4.PageRouteInfo>? children})
      : super(ProfileRouter.name, path: 'profile', initialChildren: children);

  static const String name = 'ProfileRouter';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class SettingsRouter extends _i4.PageRouteInfo<void> {
  const SettingsRouter({List<_i4.PageRouteInfo>? children})
      : super(SettingsRouter.name, path: 'settings', initialChildren: children);

  static const String name = 'SettingsRouter';
}

/// generated route for
/// [_i7.HomeScreen]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i8.CategoriesScreen]
class CategoriesRoute extends _i4.PageRouteInfo<void> {
  const CategoriesRoute() : super(CategoriesRoute.name, path: 'categories');

  static const String name = 'CategoriesRoute';
}

/// generated route for
/// [_i9.AllCategoriesScreen]
class AllCategoriesRoute extends _i4.PageRouteInfo<AllCategoriesRouteArgs> {
  AllCategoriesRoute(
      {_i19.Key? key, String? selectedValue, int? initialSortValue})
      : super(AllCategoriesRoute.name,
            path: 'all-categories/:id/:sortId',
            args: AllCategoriesRouteArgs(
                key: key,
                selectedValue: selectedValue,
                initialSortValue: initialSortValue),
            rawPathParams: {'id': selectedValue, 'sortId': initialSortValue});

  static const String name = 'AllCategoriesRoute';
}

class AllCategoriesRouteArgs {
  const AllCategoriesRouteArgs(
      {this.key, this.selectedValue, this.initialSortValue});

  final _i19.Key? key;

  final String? selectedValue;

  final int? initialSortValue;

  @override
  String toString() {
    return 'AllCategoriesRouteArgs{key: $key, selectedValue: $selectedValue, initialSortValue: $initialSortValue}';
  }
}

/// generated route for
/// [_i5.SearchScreen]
class SearchRoute extends _i4.PageRouteInfo<void> {
  const SearchRoute() : super(SearchRoute.name, path: 'search');

  static const String name = 'SearchRoute';
}

/// generated route for
/// [_i10.MyFavoritesTabView]
class MyFavoritesTab extends _i4.PageRouteInfo<void> {
  const MyFavoritesTab() : super(MyFavoritesTab.name, path: 'my-favorites');

  static const String name = 'MyFavoritesTab';
}

/// generated route for
/// [_i11.RatingsTabView]
class RatingsTab extends _i4.PageRouteInfo<void> {
  const RatingsTab() : super(RatingsTab.name, path: 'ratings');

  static const String name = 'RatingsTab';
}

/// generated route for
/// [_i12.WillVisitTabView]
class WillVisitTab extends _i4.PageRouteInfo<void> {
  const WillVisitTab() : super(WillVisitTab.name, path: 'will-visit');

  static const String name = 'WillVisitTab';
}

/// generated route for
/// [_i13.SettingsScreen]
class SettingsRoute extends _i4.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: '');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i14.PersonalInformationsScreen]
class PersonalInformationsRoute extends _i4.PageRouteInfo<void> {
  const PersonalInformationsRoute()
      : super(PersonalInformationsRoute.name, path: 'personal-informations');

  static const String name = 'PersonalInformationsRoute';
}

/// generated route for
/// [_i15.LanguagesScreen]
class LanguagesRoute extends _i4.PageRouteInfo<void> {
  const LanguagesRoute() : super(LanguagesRoute.name, path: 'languages');

  static const String name = 'LanguagesRoute';
}

/// generated route for
/// [_i16.ReportBugScreen]
class ReportBugRoute extends _i4.PageRouteInfo<void> {
  const ReportBugRoute() : super(ReportBugRoute.name, path: 'report-a-bug');

  static const String name = 'ReportBugRoute';
}

/// generated route for
/// [_i17.ChangePasswordScreen]
class ChangePasswordRoute extends _i4.PageRouteInfo<void> {
  const ChangePasswordRoute()
      : super(ChangePasswordRoute.name, path: 'change-password');

  static const String name = 'ChangePasswordRoute';
}

/// generated route for
/// [_i18.PrivacyPolicyScreen]
class PrivacyPolicyRoute extends _i4.PageRouteInfo<void> {
  const PrivacyPolicyRoute()
      : super(PrivacyPolicyRoute.name, path: 'privacy-policy');

  static const String name = 'PrivacyPolicyRoute';
}
