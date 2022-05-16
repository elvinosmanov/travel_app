import 'package:auto_route/auto_route.dart';
import 'package:travel_app/screens/home/all_categories.dart';
import 'package:travel_app/screens/home/categories_screen.dart';
import 'package:travel_app/screens/home/home_screen.dart';
import 'package:travel_app/screens/navigation/navigation_screen.dart';
import 'package:travel_app/screens/onboarding/onboarding_screen.dart';
import 'package:travel_app/screens/profile/profile_screen.dart';
import 'package:travel_app/screens/search/search_screen.dart';
import 'package:travel_app/screens/settings/settings_screen.dart';
import 'package:travel_app/screens/welcome/welcome_screen.dart';

@MaterialAutoRouter(replaceInRouteName: 'Screen,Route', routes: [
  //TODO: FOR NOW CHANGE PLACE
  AutoRoute(path: 'all_categories', page: AllCategoriesScreen),
  AutoRoute(path: 'onboarding', page: OnboardingScreen, initial: true),
  AutoRoute(path: 'welcome', page: WelcomeScreen),
  AutoRoute(path: '/', page: NavigationScreen, children: [
    AutoRoute(
      path: 'home',
      name: 'HomeRouter',
      page: EmptyRouterPage,
      children: [
        AutoRoute(path: '', page: HomeScreen),
        AutoRoute(path: 'categories', page: CategoriesScreen),
        // AutoRoute(path: 'all_categories', page: AllCategoriesScreen),
      ],
    ),
    AutoRoute(path: 'search', name: 'SearchRouter', page: SearchScreen),
    AutoRoute(path: 'profile', name: 'ProfileRouter', page: ProfileScreen),
    AutoRoute(path: 'settings', name: 'SettingsRouter', page: SettingsScreen),
  ]),
])
class $AppRouter {}
