import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/components/custom_button.dart';
import 'package:travel_app/components/custom_textfield.dart';
import 'package:travel_app/components/text_between_line.dart';
import 'package:travel_app/core/extensions.dart';
import 'package:travel_app/core/styles.dart';

import '../../../core/R.dart';
import '../../../core/colors.dart';

class RegisterBottomContainer extends StatelessWidget {
  const RegisterBottomContainer({
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
            'Register new account'.heading1(),
            'Please log in to your account'.regularTextStyle(14).padding(top: 6, bottom: 20),
            const UsernameTextField().padding(bottom: 6),
            const PasswordTextField(),
            const EmailTextField().padding(top: 6, bottom: 6),
            const PhoneNumberTextField(),
            _buildTermAndConditions().padding(top: 16, bottom: 25),
            CustomButton.text(text: 'Sign Up'.semiBoldTextStyle(15, kWhiteColor), color: kBlueColor),
            const TextBetweenLine(text: 'Or continue with').padding(top: 55, bottom: 20),
            _buildFacebookGoogleButtons()
          ],
        ));
  }

  Row _buildTermAndConditions() {
    return Row(children: <Widget>[
      SvgPicture.asset(
        R.check,
        fit: BoxFit.scaleDown,
      ).padding(right: 12),
      Text.rich(TextSpan(
          text: 'By creating an account, you agree to our',
          style: kMediumTextStyle(13, kDarkGreyColor),
          children: [TextSpan(text: '\nTerm and Conditions', style: kSemiBoldTextStyle(13))]))
    ]);
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

class PhoneNumberTextField extends StatelessWidget {
  const PhoneNumberTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomTextField(label: 'Phone Number', isMandatory: true);
  }
}

class UsernameTextField extends StatelessWidget {
  const UsernameTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomTextField(label: 'Username', isMandatory: true);
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
      isMandatory: true,
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
      label: 'Email',
      isMandatory: true,
    );
  }
}
