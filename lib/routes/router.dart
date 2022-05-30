import 'package:auto_route/auto_route.dart';
import 'package:travel_app/screens/home/all_categories.dart';
import 'package:travel_app/screens/home/all_comments_screen.dart';
import 'package:travel_app/screens/home/categories_screen.dart';
import 'package:travel_app/screens/home/details_screen.dart';
import 'package:travel_app/screens/home/home_screen.dart';
import 'package:travel_app/screens/navigation/navigation_screen.dart';
import 'package:travel_app/screens/onboarding/onboarding_screen.dart';
import 'package:travel_app/screens/profile/profile_screen.dart';
import 'package:travel_app/screens/search/search_screen.dart';
import 'package:travel_app/screens/settings/change_password_screen.dart';
import 'package:travel_app/screens/settings/languages_screen.dart';
import 'package:travel_app/screens/settings/personal_informations_screen.dart';
import 'package:travel_app/screens/settings/privacy_policy_screen.dart';
import 'package:travel_app/screens/settings/report_bug_screen.dart';
import 'package:travel_app/screens/settings/settings_screen.dart';
import 'package:travel_app/screens/welcome/welcome_screen.dart';

import '../screens/profile/widgets/my_favorites_tab_view.dart';
import '../screens/profile/widgets/ratings_tab_view.dart';
import '../screens/profile/widgets/will_visit_tab_view.dart';

@MaterialAutoRouter(replaceInRouteName: 'Screen,Route', routes: [
  AutoRoute(path: 'onboarding', page: OnboardingScreen),
  AutoRoute(path: 'welcome', page: WelcomeScreen),
  AutoRoute(path: '/', page: NavigationScreen, children: [
    AutoRoute(
      path: 'home',
      name: 'HomeRouter',
      page: EmptyRouterPage,
      children: [
        AutoRoute(path: '', page: HomeScreen),
        AutoRoute(path: 'categories', page: CategoriesScreen),
        // AutoRoute(path: 'all-categories', page: AllCategoriesScreen),
        AutoRoute(path: 'all-categories/:id/:sortId', page: AllCategoriesScreen),
        // CustomRoute(path: 'search', page: SearchScreen, transitionsBuilder: TransitionsBuilders.slideBottom),
        AutoRoute(path: 'details', page: DetailsScreen),
        AutoRoute(path: 'all-comments', page: AllCommentsScreen),
      ],
    ),
    AutoRoute(path: 'search', name: 'SearchRouter', page: SearchScreen),
    AutoRoute(path: 'profile', name: 'ProfileRouter', page: ProfileScreen, children: [
      // AutoRoute(path: '', page: ProfileScreen),
      AutoRoute(path: 'my-favorites', name: 'MyFavoritesTab', page: MyFavoritesTabView),
      AutoRoute(path: 'ratings', name: 'RatingsTab', page: RatingsTabView),
      AutoRoute(path: 'will-visit', name: 'WillVisitTab', page: WillVisitTabView),
    ]),
    AutoRoute(path: 'settings', name: 'SettingsRouter', page: EmptyRouterPage, children: [
      AutoRoute(path: '', page: SettingsScreen),
      AutoRoute(path: 'personal-informations', page: PersonalInformationsScreen),
      AutoRoute(path: 'languages', page: LanguagesScreen),
      AutoRoute(path: 'report-a-bug', page: ReportBugScreen),
      AutoRoute(path: 'change-password', page: ChangePasswordScreen),
      AutoRoute(path: 'privacy-policy', page: PrivacyPolicyScreen),
    ]),
  ]),
])
class $AppRouter {}
