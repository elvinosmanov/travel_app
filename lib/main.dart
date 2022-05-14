import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/core/colors.dart';
import 'package:travel_app/cubit/navigation/navigation_cubit.dart';
import 'package:travel_app/routes/router.gr.dart';
import 'package:travel_app/screens/onboarding/onboarding.dart';
import 'package:travel_app/screens/welcome/welcome_screen.dart';
import 'package:travel_app/utils/onboarding_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await OnboardingPreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
      theme: ThemeData(
        scaffoldBackgroundColor: kLightGreyColor_1,
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
        }),
      ),
      
    );
  }
}

Widget navigationPage(BuildContext context) {
  bool? isExistingUser = OnboardingPreferences.getOnboarding();
  if (isExistingUser == null) {
    return const Onboarding();
  } else {
    return const WelcomeScreen();
  }
}

// home: BlocProvider(
//         create: (context) => NavigationCubit(),
//         child:  CategoriesScreen(),
//       ),