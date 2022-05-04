import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/components/custom_button.dart';
import 'package:travel_app/components/custom_textfield.dart';
import 'package:travel_app/components/text_between_line.dart';
import 'package:travel_app/core/extensions.dart';
import 'package:travel_app/core/styles.dart';

import '../../../core/R.dart';
import '../../../core/colors.dart';

class LoginBottomContainer extends StatelessWidget {
  const LoginBottomContainer({
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
            'Welcome Back'.heading1(),
            'Please log in to your account'.regularTextStyle(14).padding(top: 6, bottom: 20),
            const EmailTextField(),
            const PasswordTextField().padding(top: 10, bottom: 10),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>['Forgot Password?'.mediumTextStyle(13)]),
            CustomButton.text(text: 'Sign In'.semiBoldTextStyle(15, kWhiteColor), color: kBlueColor)
                .padding(bottom: 20, top: 17),
            _builNoAccountButton(),
            const TextBetweenLine(text: 'Or continue with').padding(top: 17, bottom: 20),
            _buildFacebookGoogleButtons()
          ],
        ));
  }

  Center _builNoAccountButton() {
    return Center(
      child: Text.rich(
        TextSpan(
          text: 'Don’t have an account? ',
          style: kSemiBoldTextStyle(14, kDarkGreyColor),
          children: [
            TextSpan(
              text: 'Sign Up',
              style: kSemiBoldTextStyle(15, kBlueColor),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildFacebookGoogleButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        CustomButton.iconName(
          horizontalPadding: 36,
          iconName: R.googleIcon,
          color: kGoogleRedColor,
        ),
        SizedBox(width: 16),
        CustomButton.iconName(
          horizontalPadding: 36,
          iconName: R.facebookIcon,
          color: kFacebookBlueColor,
        )
      ],
    );
  }
}

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintText: 'Password',
      suffix: SvgPicture.asset(R.openEye),
    );
  }
}

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomTextField(
      hintText: 'Email or phone number',
    );
  }
}
