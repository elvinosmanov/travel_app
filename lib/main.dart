import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/core/colors.dart';
import 'package:travel_app/cubit/category/category_cubit.dart';
import 'package:travel_app/cubit/place/place_cubit.dart';
import 'package:travel_app/routes/router.gr.dart';
import 'package:travel_app/utils/onboarding_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await OnboardingPreferences.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CategoryCubit()),
        BlocProvider(create: (context) => PlaceCubit()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Travel App',
        theme: ThemeData(
          splashColor: kDarkGreyColor.withOpacity(0.2),
          highlightColor: kDarkGreyColor.withOpacity(0.2),
          scaffoldBackgroundColor: kLightGreyColor_1,
          colorScheme: ColorScheme.fromSwatch(accentColor: kDarkGreyColor),
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
          }),
        ),
        routeInformationParser: _appRouter.defaultRouteParser(includePrefixMatches: true),
        routerDelegate: _appRouter.delegate(
          initialRoutes: [navigationPage()],
        ),
      ),
    );
  }
}

PageRouteInfo<dynamic> navigationPage() {
  bool? isExistingUser = OnboardingPreferences.getOnboarding();
  if (isExistingUser == null) {
    return const OnboardingRoute();
  } else {
    return const NavigationRoute();
  }
}

// home: BlocProvider(
//         create: (context) => NavigationCubit(),
//         child:  CategoriesScreen(),
//       ),