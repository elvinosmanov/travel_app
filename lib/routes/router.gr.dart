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
import 'package:flutter/material.dart' as _i22;

import '../models/category.dart' as _i23;
import '../screens/home/all_categories.dart' as _i11;
import '../screens/home/all_comments_screen.dart' as _i4;
import '../screens/home/categories_screen.dart' as _i10;
import '../screens/home/details_screen.dart' as _i12;
import '../screens/home/home_screen.dart' as _i9;
import '../screens/navigation/navigation_screen.dart' as _i5;
import '../screens/onboarding/onboarding_screen.dart' as _i1;
import '../screens/profile/profile_screen.dart' as _i8;
import '../screens/profile/widgets/my_favorites_tab_view.dart' as _i13;
import '../screens/profile/widgets/ratings_tab_view.dart' as _i14;
import '../screens/profile/widgets/will_visit_tab_view.dart' as _i15;
import '../screens/search/search_screen.dart' as _i7;
import '../screens/settings/change_password_screen.dart' as _i20;
import '../screens/settings/languages_screen.dart' as _i18;
import '../screens/settings/personal_informations_screen.dart' as _i17;
import '../screens/settings/privacy_policy_screen.dart' as _i21;
import '../screens/settings/report_bug_screen.dart' as _i19;
import '../screens/settings/settings_screen.dart' as _i16;
import '../screens/splash/splash_screen.dart' as _i2;
import '../screens/welcome/welcome_screen.dart' as _i3;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i22.GlobalKey<_i22.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    OnboardingRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.OnboardingScreen());
    },
    SplashRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SplashScreen());
    },
    WelcomeRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.WelcomeScreen());
    },
    AllCommentsRoute.name: (routeData) {
      final args = routeData.argsAs<AllCommentsRouteArgs>();
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.AllCommentsScreen(key: args.key, placeId: args.placeId));
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
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    HomeRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.HomeScreen());
    },
    CategoriesRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.CategoriesScreen());
    },
    AllCategoriesRoute.name: (routeData) {
      final args = routeData.argsAs<AllCategoriesRouteArgs>(
          orElse: () => const AllCategoriesRouteArgs());
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i11.AllCategoriesScreen(
              key: args.key, selectedCategory: args.selectedCategory));
    },
    DetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<DetailsRouteArgs>(
          orElse: () => DetailsRouteArgs(placeId: pathParams.getString('id')));
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i12.DetailsScreen(key: args.key, placeId: args.placeId));
    },
    MyFavoritesTab.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.MyFavoritesTabView());
    },
    RatingsTab.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.RatingsTabView());
    },
    WillVisitTab.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.WillVisitTabView());
    },
    SettingsRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i16.SettingsScreen());
    },
    PersonalInformationsRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i17.PersonalInformationsScreen());
    },
    LanguagesRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i18.LanguagesScreen());
    },
    ReportBugRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i19.ReportBugScreen());
    },
    ChangePasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ChangePasswordRouteArgs>(
          orElse: () => const ChangePasswordRouteArgs());
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i20.ChangePasswordScreen(key: args.key));
    },
    PrivacyPolicyRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i21.PrivacyPolicyScreen());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(OnboardingRoute.name, path: 'onboarding'),
        _i6.RouteConfig(SplashRoute.name, path: 'splash'),
        _i6.RouteConfig(WelcomeRoute.name, path: 'welcome'),
        _i6.RouteConfig(AllCommentsRoute.name, path: 'all-comments'),
        _i6.RouteConfig(NavigationRoute.name, path: '/', children: [
          _i6.RouteConfig(HomeRouter.name,
              path: 'home',
              parent: NavigationRoute.name,
              children: [
                _i6.RouteConfig(HomeRoute.name,
                    path: '', parent: HomeRouter.name),
                _i6.RouteConfig(CategoriesRoute.name,
                    path: 'categories', parent: HomeRouter.name),
                _i6.RouteConfig(AllCategoriesRoute.name,
                    path: 'all-categories', parent: HomeRouter.name),
                _i6.RouteConfig(DetailsRoute.name,
                    path: 'details/:id', parent: HomeRouter.name)
              ]),
          _i6.RouteConfig(SearchRouter.name,
              path: 'search', parent: NavigationRoute.name),
          _i6.RouteConfig(ProfileRouter.name,
              path: 'profile',
              parent: NavigationRoute.name,
              children: [
                _i6.RouteConfig(MyFavoritesTab.name,
                    path: 'my-favorites', parent: ProfileRouter.name),
                _i6.RouteConfig(RatingsTab.name,
                    path: 'ratings', parent: ProfileRouter.name),
                _i6.RouteConfig(WillVisitTab.name,
                    path: 'will-visit', parent: ProfileRouter.name)
              ]),
          _i6.RouteConfig(SettingsRouter.name,
              path: 'settings',
              parent: NavigationRoute.name,
              children: [
                _i6.RouteConfig(SettingsRoute.name,
                    path: '', parent: SettingsRouter.name),
                _i6.RouteConfig(PersonalInformationsRoute.name,
                    path: 'personal-informations', parent: SettingsRouter.name),
                _i6.RouteConfig(LanguagesRoute.name,
                    path: 'languages', parent: SettingsRouter.name),
                _i6.RouteConfig(ReportBugRoute.name,
                    path: 'report-a-bug', parent: SettingsRouter.name),
                _i6.RouteConfig(ChangePasswordRoute.name,
                    path: 'change-password', parent: SettingsRouter.name),
                _i6.RouteConfig(PrivacyPolicyRoute.name,
                    path: 'privacy-policy', parent: SettingsRouter.name)
              ])
        ])
      ];
}

/// generated route for
/// [_i1.OnboardingScreen]
class OnboardingRoute extends _i6.PageRouteInfo<void> {
  const OnboardingRoute() : super(OnboardingRoute.name, path: 'onboarding');

  static const String name = 'OnboardingRoute';
}

/// generated route for
/// [_i2.SplashScreen]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: 'splash');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i3.WelcomeScreen]
class WelcomeRoute extends _i6.PageRouteInfo<void> {
  const WelcomeRoute() : super(WelcomeRoute.name, path: 'welcome');

  static const String name = 'WelcomeRoute';
}

/// generated route for
/// [_i4.AllCommentsScreen]
class AllCommentsRoute extends _i6.PageRouteInfo<AllCommentsRouteArgs> {
  AllCommentsRoute({_i22.Key? key, required String placeId})
      : super(AllCommentsRoute.name,
            path: 'all-comments',
            args: AllCommentsRouteArgs(key: key, placeId: placeId));

  static const String name = 'AllCommentsRoute';
}

class AllCommentsRouteArgs {
  const AllCommentsRouteArgs({this.key, required this.placeId});

  final _i22.Key? key;

  final String placeId;

  @override
  String toString() {
    return 'AllCommentsRouteArgs{key: $key, placeId: $placeId}';
  }
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
  const ProfileRouter({List<_i6.PageRouteInfo>? children})
      : super(ProfileRouter.name, path: 'profile', initialChildren: children);

  static const String name = 'ProfileRouter';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class SettingsRouter extends _i6.PageRouteInfo<void> {
  const SettingsRouter({List<_i6.PageRouteInfo>? children})
      : super(SettingsRouter.name, path: 'settings', initialChildren: children);

  static const String name = 'SettingsRouter';
}

/// generated route for
/// [_i9.HomeScreen]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i10.CategoriesScreen]
class CategoriesRoute extends _i6.PageRouteInfo<void> {
  const CategoriesRoute() : super(CategoriesRoute.name, path: 'categories');

  static const String name = 'CategoriesRoute';
}

/// generated route for
/// [_i11.AllCategoriesScreen]
class AllCategoriesRoute extends _i6.PageRouteInfo<AllCategoriesRouteArgs> {
  AllCategoriesRoute({_i22.Key? key, _i23.CategoryModel? selectedCategory})
      : super(AllCategoriesRoute.name,
            path: 'all-categories',
            args: AllCategoriesRouteArgs(
                key: key, selectedCategory: selectedCategory));

  static const String name = 'AllCategoriesRoute';
}

class AllCategoriesRouteArgs {
  const AllCategoriesRouteArgs({this.key, this.selectedCategory});

  final _i22.Key? key;

  final _i23.CategoryModel? selectedCategory;

  @override
  String toString() {
    return 'AllCategoriesRouteArgs{key: $key, selectedCategory: $selectedCategory}';
  }
}

/// generated route for
/// [_i12.DetailsScreen]
class DetailsRoute extends _i6.PageRouteInfo<DetailsRouteArgs> {
  DetailsRoute({_i22.Key? key, required String placeId})
      : super(DetailsRoute.name,
            path: 'details/:id',
            args: DetailsRouteArgs(key: key, placeId: placeId),
            rawPathParams: {'id': placeId});

  static const String name = 'DetailsRoute';
}

class DetailsRouteArgs {
  const DetailsRouteArgs({this.key, required this.placeId});

  final _i22.Key? key;

  final String placeId;

  @override
  String toString() {
    return 'DetailsRouteArgs{key: $key, placeId: $placeId}';
  }
}

/// generated route for
/// [_i13.MyFavoritesTabView]
class MyFavoritesTab extends _i6.PageRouteInfo<void> {
  const MyFavoritesTab() : super(MyFavoritesTab.name, path: 'my-favorites');

  static const String name = 'MyFavoritesTab';
}

/// generated route for
/// [_i14.RatingsTabView]
class RatingsTab extends _i6.PageRouteInfo<void> {
  const RatingsTab() : super(RatingsTab.name, path: 'ratings');

  static const String name = 'RatingsTab';
}

/// generated route for
/// [_i15.WillVisitTabView]
class WillVisitTab extends _i6.PageRouteInfo<void> {
  const WillVisitTab() : super(WillVisitTab.name, path: 'will-visit');

  static const String name = 'WillVisitTab';
}

/// generated route for
/// [_i16.SettingsScreen]
class SettingsRoute extends _i6.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: '');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i17.PersonalInformationsScreen]
class PersonalInformationsRoute extends _i6.PageRouteInfo<void> {
  const PersonalInformationsRoute()
      : super(PersonalInformationsRoute.name, path: 'personal-informations');

  static const String name = 'PersonalInformationsRoute';
}

/// generated route for
/// [_i18.LanguagesScreen]
class LanguagesRoute extends _i6.PageRouteInfo<void> {
  const LanguagesRoute() : super(LanguagesRoute.name, path: 'languages');

  static const String name = 'LanguagesRoute';
}

/// generated route for
/// [_i19.ReportBugScreen]
class ReportBugRoute extends _i6.PageRouteInfo<void> {
  const ReportBugRoute() : super(ReportBugRoute.name, path: 'report-a-bug');

  static const String name = 'ReportBugRoute';
}

/// generated route for
/// [_i20.ChangePasswordScreen]
class ChangePasswordRoute extends _i6.PageRouteInfo<ChangePasswordRouteArgs> {
  ChangePasswordRoute({_i22.Key? key})
      : super(ChangePasswordRoute.name,
            path: 'change-password', args: ChangePasswordRouteArgs(key: key));

  static const String name = 'ChangePasswordRoute';
}

class ChangePasswordRouteArgs {
  const ChangePasswordRouteArgs({this.key});

  final _i22.Key? key;

  @override
  String toString() {
    return 'ChangePasswordRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i21.PrivacyPolicyScreen]
class PrivacyPolicyRoute extends _i6.PageRouteInfo<void> {
  const PrivacyPolicyRoute()
      : super(PrivacyPolicyRoute.name, path: 'privacy-policy');

  static const String name = 'PrivacyPolicyRoute';
}
