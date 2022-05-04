import 'package:flutter/material.dart';
import 'package:travel_app/components/custom_button.dart';
import 'package:travel_app/components/text_between_line.dart';
import 'package:travel_app/core/R.dart';
import 'package:travel_app/core/colors.dart';
import 'package:travel_app/core/extensions.dart';
import 'package:travel_app/core/styles.dart';

import '../core/constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackgroundImage(context),
          Align(
            alignment: Alignment.topCenter,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(R.logo).padding(right: 16),
                appName.boldTextStyle(36, kWhiteColor)
              ],
            ),
          ).padding(top: 70),
          const Align(
            alignment: Alignment.bottomCenter,
            child: _BuildBottomContainer(),
          )
        ],
      ),
    );
  }

  SizedBox _buildBackgroundImage(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Image.asset(
        R.loginBackground,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}

class _BuildBottomContainer extends StatelessWidget {
  const _BuildBottomContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(color: kWhiteColor, borderRadius: kRadius16),
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            'Welcome to $appName'.heading1(),
            'Live life with no excuses, travel with no regret'.regularTextStyle(14).padding(top: 6),
            Center(
              child: CustomButton(
                color: kGoogleRedColor,
                iconName: R.googleIcon,
                text: 'Continue with Google'.semiBoldTextStyle(15, kWhiteColor),
              ).padding(top: 30),
            ),
            CustomButton(
              color: kFacebookBlueColor,
              iconName: R.facebookIcon,
              text: 'Continue with Facebook'.semiBoldTextStyle(15, kWhiteColor),
            ).padding(top: 10),
            Center(
              child: 'Continue as guest'
                  .mediumTextStyle(14)
                  .copyWith(
                    const TextStyle(decoration: TextDecoration.underline),
                  )
                  .padding(top: 16, bottom: 17),
            ),
            const TextBetweenLine(text: 'Or'),
            _buildSignButtons().padding(top: 20)
          ],
        ));
  }

  Row _buildSignButtons() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          child: CustomButton.text(
            color: kBlueColor,
            text: 'Sign In'.semiBoldTextStyle(15, kWhiteColor),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: CustomButton.text(
            color: kBlackColor,
            text: 'Sign Up'.semiBoldTextStyle(15, kWhiteColor),
          ),
        )
      ],
    );
  }
}
