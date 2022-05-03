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
          Image.asset(R.loginBackground),
          const Align(
            alignment: Alignment.bottomCenter,
            child: _BuildBottomContainer(),
          )
        ],
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
            CustomButton.text(
              color: kGoogleRedColor,
              text: 'Continue with Google'.semiBoldTextStyle(15, kWhiteColor),
            ).padding(top: 30),
            CustomButton.text(
              color: kFacebookBlueColor,
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
            _buildSignButtons()
          ],
        ));
  }

  Row _buildSignButtons() {
    return Row(
      children: <Widget>[
        CustomButton.text(
          color: kBlueColor,
          text: 'Sign In'.semiBoldTextStyle(15),
        )
      ],
    );
  }
}
