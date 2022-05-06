import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/components/custom_button.dart';
import 'package:travel_app/components/custom_textfield.dart';
import 'package:travel_app/components/text_between_line.dart';
import 'package:travel_app/core/styles.dart';
import 'package:travel_app/extensions/extensions.dart';

import '../../../core/R.dart';
import '../../../core/colors.dart';

class LoginBottomContainer extends StatelessWidget {
  const LoginBottomContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        'Welcome Back'.heading1(),
        'Please log in to your account'.regularTextStyle(14).padding(top: 6, bottom: 20),
        const EmailTextField(),
        const PasswordTextField().padding(top: 10, bottom: 10),
        _buildForgetPasswordButton(),
        _buildSignInButton().padding(bottom: 20, top: 17),
        _builNoAccountButton(),
        const TextBetweenLine(text: 'Or continue with').padding(top: 17, bottom: 20),
        _buildFacebookGoogleButtons()
      ],
    );
  }

  Row _buildForgetPasswordButton() =>
      Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>['Forgot Password?'.mediumTextStyle(13)]);

  CustomButton _buildSignInButton() =>
      CustomButton.text(text: 'Sign In'.semiBoldTextStyle(15, kWhiteColor), color: kBlueColor);

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
      label: 'Password',
      suffixIcon: SvgPicture.asset(
        R.openEye,
        fit: BoxFit.scaleDown,
      ),
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
      label: 'Email or phone number',
    );
  }
}
