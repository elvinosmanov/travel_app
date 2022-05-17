import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/core/R.dart';
import 'package:travel_app/core/colors.dart';
import 'package:travel_app/routes/router.gr.dart';
import 'package:travel_app/screens/home/details_screen.dart';
import 'package:travel_app/utils/onboarding_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await OnboardingPreferences.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      theme: ThemeData(
        scaffoldBackgroundColor: kLightGreyColor_1,
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
        }),
      ),
      routeInformationParser: _appRouter.defaultRouteParser(includePrefixMatches: true),
      routerDelegate: _appRouter.delegate(
        initialRoutes: [
          DetailsRoute(
            images: const [R.accomodationImage, R.gastronomyImage, R.mateImage],
            likeCount: 350,
            messageCount: 12,
            rate: 3.8,
            viewCount: 450,
            isLiked: false,
          )
          // const AllCategoriesRoute(),
          // navigationPage(),
        ],
      ),
    );
  }
}

PageRouteInfo<dynamic> navigationPage() {
  bool? isExistingUser = OnboardingPreferences.getOnboarding();
  // ignore: avoid_print
  print(isExistingUser);
  if (isExistingUser == null) {
    return const OnboardingRoute();
  } else {
    return const WelcomeRoute();
  }
}

// home: BlocProvider(
//         create: (context) => NavigationCubit(),
//         child:  CategoriesScreen(),
//       ),