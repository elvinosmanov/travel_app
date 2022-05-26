// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i21;

import '../screens/home/all_categories.dart' as _i1;
import '../screens/home/all_comments_screen.dart' as _i3;
import '../screens/home/categories_screen.dart' as _i11;
import '../screens/home/details_screen.dart' as _i2;
import '../screens/home/home_screen.dart' as _i10;
import '../screens/navigation/navigation_screen.dart' as _i6;
import '../screens/onboarding/onboarding_screen.dart' as _i4;
import '../screens/profile/profile_screen.dart' as _i9;
import '../screens/profile/widgets/my_favorites_tab_view.dart' as _i12;
import '../screens/profile/widgets/ratings_tab_view.dart' as _i13;
import '../screens/profile/widgets/will_visit_tab_view.dart' as _i14;
import '../screens/search/search_screen.dart' as _i8;
import '../screens/settings/change_password_screen.dart' as _i19;
import '../screens/settings/languages_screen.dart' as _i17;
import '../screens/settings/personal_informations_screen.dart' as _i16;
import '../screens/settings/privacy_policy_screen.dart' as _i20;
import '../screens/settings/report_bug_screen.dart' as _i18;
import '../screens/settings/settings_screen.dart' as _i15;
import '../screens/welcome/welcome_screen.dart' as _i5;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i21.GlobalKey<_i21.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    AllCategoriesRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.AllCategoriesScreen());
    },
    DetailsRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsRouteArgs>();
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.DetailsScreen(
              key: args.key,
              isLiked: args.isLiked,
              images: args.images,
              viewCount: args.viewCount,
              commentCount: args.commentCount,
              likeCount: args.likeCount,
              rate: args.rate));
    },
    AllCommentsRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.AllCommentsScreen());
    },
    OnboardingRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.OnboardingScreen());
    },
    WelcomeRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.WelcomeScreen());
    },
    NavigationRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.NavigationScreen());
    },
    HomeRouter.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.EmptyRouterPage());
    },
    SearchRouter.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.SearchScreen());
    },
    ProfileRouter.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.ProfileScreen());
    },
    SettingsRouter.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.EmptyRouterPage());
    },
    HomeRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.HomeScreen());
    },
    CategoriesRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.CategoriesScreen());
    },
    MyFavoritesTab.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.MyFavoritesTabView());
    },
    RatingsTab.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.RatingsTabView());
    },
    WillVisitTab.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.WillVisitTabView());
    },
    SettingsRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.SettingsScreen());
    },
    PersonalInformationsRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i16.PersonalInformationsScreen());
    },
    LanguagesRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i17.LanguagesScreen());
    },
    ReportBugRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i18.ReportBugScreen());
    },
    ChangePasswordRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i19.ChangePasswordScreen());
    },
    PrivacyPolicyRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i20.PrivacyPolicyScreen());
    }
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(AllCategoriesRoute.name, path: 'all_categories'),
        _i7.RouteConfig(DetailsRoute.name, path: 'details'),
        _i7.RouteConfig(AllCommentsRoute.name, path: 'all_comments'),
        _i7.RouteConfig(OnboardingRoute.name, path: 'onboarding'),
        _i7.RouteConfig(WelcomeRoute.name, path: 'welcome'),
        _i7.RouteConfig(NavigationRoute.name, path: '/', children: [
          _i7.RouteConfig(HomeRouter.name,
              path: 'home',
              parent: NavigationRoute.name,
              children: [
                _i7.RouteConfig(HomeRoute.name,
                    path: '', parent: HomeRouter.name),
                _i7.RouteConfig(CategoriesRoute.name,
                    path: 'categories', parent: HomeRouter.name)
              ]),
          _i7.RouteConfig(SearchRouter.name,
              path: 'search', parent: NavigationRoute.name),
          _i7.RouteConfig(ProfileRouter.name,
              path: 'profile',
              parent: NavigationRoute.name,
              children: [
                _i7.RouteConfig(MyFavoritesTab.name,
                    path: 'my-favorites', parent: ProfileRouter.name),
                _i7.RouteConfig(RatingsTab.name,
                    path: 'ratings', parent: ProfileRouter.name),
                _i7.RouteConfig(WillVisitTab.name,
                    path: 'will-visit', parent: ProfileRouter.name)
              ]),
          _i7.RouteConfig(SettingsRouter.name,
              path: 'settings',
              parent: NavigationRoute.name,
              children: [
                _i7.RouteConfig(SettingsRoute.name,
                    path: '', parent: SettingsRouter.name),
                _i7.RouteConfig(PersonalInformationsRoute.name,
                    path: 'personal-informations', parent: SettingsRouter.name),
                _i7.RouteConfig(LanguagesRoute.name,
                    path: 'languages', parent: SettingsRouter.name),
                _i7.RouteConfig(ReportBugRoute.name,
                    path: 'report-a-bug', parent: SettingsRouter.name),
                _i7.RouteConfig(ChangePasswordRoute.name,
                    path: 'change-password', parent: SettingsRouter.name),
                _i7.RouteConfig(PrivacyPolicyRoute.name,
                    path: 'privacy-policy', parent: SettingsRouter.name)
              ])
        ])
      ];
}

/// generated route for
/// [_i1.AllCategoriesScreen]
class AllCategoriesRoute extends _i7.PageRouteInfo<void> {
  const AllCategoriesRoute()
      : super(AllCategoriesRoute.name, path: 'all_categories');

  static const String name = 'AllCategoriesRoute';
}

/// generated route for
/// [_i2.DetailsScreen]
class DetailsRoute extends _i7.PageRouteInfo<DetailsRouteArgs> {
  DetailsRoute(
      {_i21.Key? key,
      bool isLiked = false,
      required List<String> images,
      required int viewCount,
      required int commentCount,
      required int likeCount,
      required double rate})
      : super(DetailsRoute.name,
            path: 'details',
            args: DetailsRouteArgs(
                key: key,
                isLiked: isLiked,
                images: images,
                viewCount: viewCount,
                commentCount: commentCount,
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
      required this.commentCount,
      required this.likeCount,
      required this.rate});

  final _i21.Key? key;

  final bool isLiked;

  final List<String> images;

  final int viewCount;

  final int commentCount;

  final int likeCount;

  final double rate;

  @override
  String toString() {
    return 'DetailsRouteArgs{key: $key, isLiked: $isLiked, images: $images, viewCount: $viewCount, commentCount: $commentCount, likeCount: $likeCount, rate: $rate}';
  }
}

/// generated route for
/// [_i3.AllCommentsScreen]
class AllCommentsRoute extends _i7.PageRouteInfo<void> {
  const AllCommentsRoute() : super(AllCommentsRoute.name, path: 'all_comments');

  static const String name = 'AllCommentsRoute';
}

/// generated route for
/// [_i4.OnboardingScreen]
class OnboardingRoute extends _i7.PageRouteInfo<void> {
  const OnboardingRoute() : super(OnboardingRoute.name, path: 'onboarding');

  static const String name = 'OnboardingRoute';
}

/// generated route for
/// [_i5.WelcomeScreen]
class WelcomeRoute extends _i7.PageRouteInfo<void> {
  const WelcomeRoute() : super(WelcomeRoute.name, path: 'welcome');

  static const String name = 'WelcomeRoute';
}

/// generated route for
/// [_i6.NavigationScreen]
class NavigationRoute extends _i7.PageRouteInfo<void> {
  const NavigationRoute({List<_i7.PageRouteInfo>? children})
      : super(NavigationRoute.name, path: '/', initialChildren: children);

  static const String name = 'NavigationRoute';
}

/// generated route for
/// [_i7.EmptyRouterPage]
class HomeRouter extends _i7.PageRouteInfo<void> {
  const HomeRouter({List<_i7.PageRouteInfo>? children})
      : super(HomeRouter.name, path: 'home', initialChildren: children);

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i8.SearchScreen]
class SearchRouter extends _i7.PageRouteInfo<void> {
  const SearchRouter() : super(SearchRouter.name, path: 'search');

  static const String name = 'SearchRouter';
}

/// generated route for
/// [_i9.ProfileScreen]
class ProfileRouter extends _i7.PageRouteInfo<void> {
  const ProfileRouter({List<_i7.PageRouteInfo>? children})
      : super(ProfileRouter.name, path: 'profile', initialChildren: children);

  static const String name = 'ProfileRouter';
}

/// generated route for
/// [_i7.EmptyRouterPage]
class SettingsRouter extends _i7.PageRouteInfo<void> {
  const SettingsRouter({List<_i7.PageRouteInfo>? children})
      : super(SettingsRouter.name, path: 'settings', initialChildren: children);

  static const String name = 'SettingsRouter';
}

/// generated route for
/// [_i10.HomeScreen]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i11.CategoriesScreen]
class CategoriesRoute extends _i7.PageRouteInfo<void> {
  const CategoriesRoute() : super(CategoriesRoute.name, path: 'categories');

  static const String name = 'CategoriesRoute';
}

/// generated route for
/// [_i12.MyFavoritesTabView]
class MyFavoritesTab extends _i7.PageRouteInfo<void> {
  const MyFavoritesTab() : super(MyFavoritesTab.name, path: 'my-favorites');

  static const String name = 'MyFavoritesTab';
}

/// generated route for
/// [_i13.RatingsTabView]
class RatingsTab extends _i7.PageRouteInfo<void> {
  const RatingsTab() : super(RatingsTab.name, path: 'ratings');

  static const String name = 'RatingsTab';
}

/// generated route for
/// [_i14.WillVisitTabView]
class WillVisitTab extends _i7.PageRouteInfo<void> {
  const WillVisitTab() : super(WillVisitTab.name, path: 'will-visit');

  static const String name = 'WillVisitTab';
}

/// generated route for
/// [_i15.SettingsScreen]
class SettingsRoute extends _i7.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: '');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i16.PersonalInformationsScreen]
class PersonalInformationsRoute extends _i7.PageRouteInfo<void> {
  const PersonalInformationsRoute()
      : super(PersonalInformationsRoute.name, path: 'personal-informations');

  static const String name = 'PersonalInformationsRoute';
}

/// generated route for
/// [_i17.LanguagesScreen]
class LanguagesRoute extends _i7.PageRouteInfo<void> {
  const LanguagesRoute() : super(LanguagesRoute.name, path: 'languages');

  static const String name = 'LanguagesRoute';
}

/// generated route for
/// [_i18.ReportBugScreen]
class ReportBugRoute extends _i7.PageRouteInfo<void> {
  const ReportBugRoute() : super(ReportBugRoute.name, path: 'report-a-bug');

  static const String name = 'ReportBugRoute';
}

/// generated route for
/// [_i19.ChangePasswordScreen]
class ChangePasswordRoute extends _i7.PageRouteInfo<void> {
  const ChangePasswordRoute()
      : super(ChangePasswordRoute.name, path: 'change-password');

  static const String name = 'ChangePasswordRoute';
}

/// generated route for
/// [_i20.PrivacyPolicyScreen]
class PrivacyPolicyRoute extends _i7.PageRouteInfo<void> {
  const PrivacyPolicyRoute()
      : super(PrivacyPolicyRoute.name, path: 'privacy-policy');

  static const String name = 'PrivacyPolicyRoute';
}
