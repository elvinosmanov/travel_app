import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:travel_app/core/R.dart';
import 'package:travel_app/core/colors.dart';
import 'package:travel_app/extensions.dart/extensions.dart';
import 'package:travel_app/screens/auth/cubit/welcome_cubit.dart';
import 'package:travel_app/screens/auth/widgets/login_bottom.dart';
import 'package:travel_app/screens/auth/widgets/register_bottom.dart';
import 'package:travel_app/screens/auth/widgets/welcome_bottom.dart';
import '../../core/constants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildBackgroundImage(context),
        Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.transparent,
          body: BlocProvider(
            create: (context) => WelcomeCubit(),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[Image.asset(R.logo).padding(right: 16), appName.boldTextStyle(36, kWhiteColor)],
                  ),
                ).padding(top: 70),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: BlocBuilder<WelcomeCubit, WelcomeState>(
                    builder: (context, state) {
                      switch (state.status) {
                        case WelcomeStatus.welcome:
                          return const WelcomeBottomContainer();
                        case WelcomeStatus.login:
                          return const LoginBottomContainer();
                        case WelcomeStatus.register:
                          return const RegisterBottomContainer();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  SizedBox _buildBackgroundImage(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        R.loginBackground,
        fit: BoxFit.fill,
      ),
    );
  }
}
