import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/bloc/auth/auth_bloc.dart';
import 'package:travel_app/screens/navigation/navigation_screen.dart';
import 'package:travel_app/screens/welcome/welcome_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return state.authUser != null ? const NavigationScreen() : const WelcomeScreen();
      },
    );
  }
}
