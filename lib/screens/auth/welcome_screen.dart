import 'package:flutter/material.dart';

import 'package:travel_app/core/R.dart';
import 'package:travel_app/core/colors.dart';
import 'package:travel_app/core/extensions.dart';
import 'package:travel_app/screens/auth/widgets/login_bottom.dart';

import '../../core/constants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildBackgroundImage(context),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[Image.asset(R.logo).padding(right: 16), appName.boldTextStyle(36, kWhiteColor)],
                ),
              ).padding(top: 70),
              const Align(
                alignment: Alignment.bottomCenter,
                child: LoginBottomContainer(),
              ),
            ],
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
