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
import 'package:flutter/material.dart' as _i21;

import '../models/category.dart' as _i22;
import '../screens/home/all_categories.dart' as _i10;
import '../screens/home/all_comments_screen.dart' as _i3;
import '../screens/home/categories_screen.dart' as _i9;
import '../screens/home/details_screen.dart' as _i11;
import '../screens/home/home_screen.dart' as _i8;
import '../screens/navigation/navigation_screen.dart' as _i4;
import '../screens/onboarding/onboarding_screen.dart' as _i1;
import '../screens/profile/profile_screen.dart' as _i7;
import '../screens/profile/widgets/my_favorites_tab_view.dart' as _i12;
import '../screens/profile/widgets/ratings_tab_view.dart' as _i13;
import '../screens/profile/widgets/will_visit_tab_view.dart' as _i14;
import '../screens/search/search_screen.dart' as _i6;
import '../screens/settings/change_password_screen.dart' as _i19;
import '../screens/settings/languages_screen.dart' as _i17;
import '../screens/settings/personal_informations_screen.dart' as _i16;
import '../screens/settings/privacy_policy_screen.dart' as _i20;
import '../screens/settings/report_bug_screen.dart' as _i18;
import '../screens/settings/settings_screen.dart' as _i15;
import '../screens/welcome/welcome_screen.dart' as _i2;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i21.GlobalKey<_i21.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    OnboardingRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.OnboardingScreen());
    },
    WelcomeRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.WelcomeScreen());
    },
    AllCommentsRoute.name: (routeData) {
      final args = routeData.argsAs<AllCommentsRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.AllCommentsScreen(key: args.key, placeId: args.placeId));
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
          routeData: routeData, child: const _i5.EmptyRouterPage());
    },
    HomeRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.HomeScreen());
    },
    CategoriesRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.CategoriesScreen());
    },
    AllCategoriesRoute.name: (routeData) {
      final args = routeData.argsAs<AllCategoriesRouteArgs>(
          orElse: () => const AllCategoriesRouteArgs());
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i10.AllCategoriesScreen(
              key: args.key, selectedCategory: args.selectedCategory));
    },
    DetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<DetailsRouteArgs>(
          orElse: () => DetailsRouteArgs(placeId: pathParams.getString('id')));
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i11.DetailsScreen(key: args.key, placeId: args.placeId));
    },
    MyFavoritesTab.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.MyFavoritesTabView());
    },
    RatingsTab.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.RatingsTabView());
    },
    WillVisitTab.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.WillVisitTabView());
    },
    SettingsRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.SettingsScreen());
    },
    PersonalInformationsRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i16.PersonalInformationsScreen());
    },
    LanguagesRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i17.LanguagesScreen());
    },
    ReportBugRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i18.ReportBugScreen());
    },
    ChangePasswordRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i19.ChangePasswordScreen());
    },
    PrivacyPolicyRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i20.PrivacyPolicyScreen());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(OnboardingRoute.name, path: 'onboarding'),
        _i5.RouteConfig(WelcomeRoute.name, path: 'welcome'),
        _i5.RouteConfig(AllCommentsRoute.name, path: 'all-comments'),
        _i5.RouteConfig(NavigationRoute.name, path: '/', children: [
          _i5.RouteConfig(HomeRouter.name,
              path: 'home',
              parent: NavigationRoute.name,
              children: [
                _i5.RouteConfig(HomeRoute.name,
                    path: '', parent: HomeRouter.name),
                _i5.RouteConfig(CategoriesRoute.name,
                    path: 'categories', parent: HomeRouter.name),
                _i5.RouteConfig(AllCategoriesRoute.name,
                    path: 'all-categories', parent: HomeRouter.name),
                _i5.RouteConfig(DetailsRoute.name,
                    path: 'details/:id', parent: HomeRouter.name)
              ]),
          _i5.RouteConfig(SearchRouter.name,
              path: 'search', parent: NavigationRoute.name),
          _i5.RouteConfig(ProfileRouter.name,
              path: 'profile',
              parent: NavigationRoute.name,
              children: [
                _i5.RouteConfig(MyFavoritesTab.name,
                    path: 'my-favorites', parent: ProfileRouter.name),
                _i5.RouteConfig(RatingsTab.name,
                    path: 'ratings', parent: ProfileRouter.name),
                _i5.RouteConfig(WillVisitTab.name,
                    path: 'will-visit', parent: ProfileRouter.name)
              ]),
          _i5.RouteConfig(SettingsRouter.name,
              path: 'settings',
              parent: NavigationRoute.name,
              children: [
                _i5.RouteConfig(SettingsRoute.name,
                    path: '', parent: SettingsRouter.name),
                _i5.RouteConfig(PersonalInformationsRoute.name,
                    path: 'personal-informations', parent: SettingsRouter.name),
                _i5.RouteConfig(LanguagesRoute.name,
                    path: 'languages', parent: SettingsRouter.name),
                _i5.RouteConfig(ReportBugRoute.name,
                    path: 'report-a-bug', parent: SettingsRouter.name),
                _i5.RouteConfig(ChangePasswordRoute.name,
                    path: 'change-password', parent: SettingsRouter.name),
                _i5.RouteConfig(PrivacyPolicyRoute.name,
                    path: 'privacy-policy', parent: SettingsRouter.name)
              ])
        ])
      ];
}

/// generated route for
/// [_i1.OnboardingScreen]
class OnboardingRoute extends _i5.PageRouteInfo<void> {
  const OnboardingRoute() : super(OnboardingRoute.name, path: 'onboarding');

  static const String name = 'OnboardingRoute';
}

/// generated route for
/// [_i2.WelcomeScreen]
class WelcomeRoute extends _i5.PageRouteInfo<void> {
  const WelcomeRoute() : super(WelcomeRoute.name, path: 'welcome');

  static const String name = 'WelcomeRoute';
}

/// generated route for
/// [_i3.AllCommentsScreen]
class AllCommentsRoute extends _i5.PageRouteInfo<AllCommentsRouteArgs> {
  AllCommentsRoute({_i21.Key? key, required String placeId})
      : super(AllCommentsRoute.name,
            path: 'all-comments',
            args: AllCommentsRouteArgs(key: key, placeId: placeId));

  static const String name = 'AllCommentsRoute';
}

class AllCommentsRouteArgs {
  const AllCommentsRouteArgs({this.key, required this.placeId});

  final _i21.Key? key;

  final String placeId;

  @override
  String toString() {
    return 'AllCommentsRouteArgs{key: $key, placeId: $placeId}';
  }
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
  const ProfileRouter({List<_i5.PageRouteInfo>? children})
      : super(ProfileRouter.name, path: 'profile', initialChildren: children);

  static const String name = 'ProfileRouter';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class SettingsRouter extends _i5.PageRouteInfo<void> {
  const SettingsRouter({List<_i5.PageRouteInfo>? children})
      : super(SettingsRouter.name, path: 'settings', initialChildren: children);

  static const String name = 'SettingsRouter';
}

/// generated route for
/// [_i8.HomeScreen]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i9.CategoriesScreen]
class CategoriesRoute extends _i5.PageRouteInfo<void> {
  const CategoriesRoute() : super(CategoriesRoute.name, path: 'categories');

  static const String name = 'CategoriesRoute';
}

/// generated route for
/// [_i10.AllCategoriesScreen]
class AllCategoriesRoute extends _i5.PageRouteInfo<AllCategoriesRouteArgs> {
  AllCategoriesRoute({_i21.Key? key, _i22.CategoryModel? selectedCategory})
      : super(AllCategoriesRoute.name,
            path: 'all-categories',
            args: AllCategoriesRouteArgs(
                key: key, selectedCategory: selectedCategory));

  static const String name = 'AllCategoriesRoute';
}

class AllCategoriesRouteArgs {
  const AllCategoriesRouteArgs({this.key, this.selectedCategory});

  final _i21.Key? key;

  final _i22.CategoryModel? selectedCategory;

  @override
  String toString() {
    return 'AllCategoriesRouteArgs{key: $key, selectedCategory: $selectedCategory}';
  }
}

/// generated route for
/// [_i11.DetailsScreen]
class DetailsRoute extends _i5.PageRouteInfo<DetailsRouteArgs> {
  DetailsRoute({_i21.Key? key, required String placeId})
      : super(DetailsRoute.name,
            path: 'details/:id',
            args: DetailsRouteArgs(key: key, placeId: placeId),
            rawPathParams: {'id': placeId});

  static const String name = 'DetailsRoute';
}

class DetailsRouteArgs {
  const DetailsRouteArgs({this.key, required this.placeId});

  final _i21.Key? key;

  final String placeId;

  @override
  String toString() {
    return 'DetailsRouteArgs{key: $key, placeId: $placeId}';
  }
}

/// generated route for
/// [_i12.MyFavoritesTabView]
class MyFavoritesTab extends _i5.PageRouteInfo<void> {
  const MyFavoritesTab() : super(MyFavoritesTab.name, path: 'my-favorites');

  static const String name = 'MyFavoritesTab';
}

/// generated route for
/// [_i13.RatingsTabView]
class RatingsTab extends _i5.PageRouteInfo<void> {
  const RatingsTab() : super(RatingsTab.name, path: 'ratings');

  static const String name = 'RatingsTab';
}

/// generated route for
/// [_i14.WillVisitTabView]
class WillVisitTab extends _i5.PageRouteInfo<void> {
  const WillVisitTab() : super(WillVisitTab.name, path: 'will-visit');

  static const String name = 'WillVisitTab';
}

/// generated route for
/// [_i15.SettingsScreen]
class SettingsRoute extends _i5.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: '');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i16.PersonalInformationsScreen]
class PersonalInformationsRoute extends _i5.PageRouteInfo<void> {
  const PersonalInformationsRoute()
      : super(PersonalInformationsRoute.name, path: 'personal-informations');

  static const String name = 'PersonalInformationsRoute';
}

/// generated route for
/// [_i17.LanguagesScreen]
class LanguagesRoute extends _i5.PageRouteInfo<void> {
  const LanguagesRoute() : super(LanguagesRoute.name, path: 'languages');

  static const String name = 'LanguagesRoute';
}

/// generated route for
/// [_i18.ReportBugScreen]
class ReportBugRoute extends _i5.PageRouteInfo<void> {
  const ReportBugRoute() : super(ReportBugRoute.name, path: 'report-a-bug');

  static const String name = 'ReportBugRoute';
}

/// generated route for
/// [_i19.ChangePasswordScreen]
class ChangePasswordRoute extends _i5.PageRouteInfo<void> {
  const ChangePasswordRoute()
      : super(ChangePasswordRoute.name, path: 'change-password');

  static const String name = 'ChangePasswordRoute';
}

/// generated route for
/// [_i20.PrivacyPolicyScreen]
class PrivacyPolicyRoute extends _i5.PageRouteInfo<void> {
  const PrivacyPolicyRoute()
      : super(PrivacyPolicyRoute.name, path: 'privacy-policy');

  static const String name = 'PrivacyPolicyRoute';
}
