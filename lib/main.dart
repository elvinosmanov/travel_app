import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/bloc/auth/auth_bloc.dart';
import 'package:travel_app/core/colors.dart';
import 'package:travel_app/cubit/category/category_cubit.dart';
import 'package:travel_app/cubit/comment/comments_cubit.dart';
import 'package:travel_app/cubit/like/like_cubit.dart';
import 'package:travel_app/cubit/place/place_cubit.dart';
import 'package:travel_app/cubit/user/user_cubit.dart';
import 'package:travel_app/repositories/auth_repository.dart';
import 'package:travel_app/repositories/user_repository.dart';
import 'package:travel_app/routes/router.gr.dart';
import 'package:travel_app/utils/onboarding_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'cubit/will_visit/will_visit_cubit.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);
  await OnboardingPreferences.init();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(),
        ),
        RepositoryProvider(
          create: (context) => UserRepository(),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CategoryCubit()),
          BlocProvider(create: (context) => PlaceCubit()),
          BlocProvider(create: (context) => LikeCubit()),
          BlocProvider(create: (context) => WillVisitCubit()),
          BlocProvider(create: (context) => CommentCubit()),
          BlocProvider(
              create: (context) => UserCubit(
                  userRepository: context.read<UserRepository>(), authRepository: context.read<AuthRepository>())),
          BlocProvider(
            create: (context) => AuthBloc(
                authRepository: context.read<AuthRepository>(), userRepository: context.read<UserRepository>()),
          )
        ],
        child: BlocBuilder<AuthBloc, AuthState>(
          buildWhen: (previous, current) => previous.authUser != current.authUser,
          builder: (context, state) {
            return MaterialApp.router(
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
                routerDelegate: AutoRouterDelegate.declarative(
                  _appRouter,
                  routes: (handler) => [if (state.authUser != null) const NavigationRoute() else welcomePage()],
                ));
          },
        ),
      ),
    );
  }
}

PageRouteInfo<dynamic> welcomePage() {
  bool? isFirstTime = OnboardingPreferences.getOnboarding();
  if (isFirstTime == null) {
    return const OnboardingRoute();
  } else {
    return const WelcomeRoute();
  }
}
