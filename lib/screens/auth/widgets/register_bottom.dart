import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/components/custom_button.dart';
import 'package:travel_app/components/custom_textfield.dart';
import 'package:travel_app/components/text_between_line.dart';
import 'package:travel_app/core/styles.dart';
import 'package:travel_app/extensions/extensions.dart';

import '../../../core/R.dart';
import '../../../core/colors.dart';

class RegisterBottomContainer extends StatelessWidget {
  const RegisterBottomContainer({
    Key? key,
  }) : super(key: key);
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final double gap = 10.0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        autovalidateMode: AutovalidateMode.always,
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            'Register new account'.heading1(),
            'Please log in to your account'.regularTextStyle(14).padding(top: 6, bottom: 20),
            const FullNameTextField().padding(bottom: gap),
            const UsernameTextField(),
            const PasswordTextField().padding(top: gap, bottom: gap),
            const EmailTextField(),
            _buildTermAndConditions().padding(top: 16, bottom: 25),
            _buildRegisterButton(),
            const TextBetweenLine(text: 'Or continue with').padding(top: 55, bottom: 20),
            _buildFacebookGoogleButtons()
          ],
        ),
      ),
    );
  }

  CustomButton _buildRegisterButton() => CustomButton.text(
        text: 'Sign Up'.semiBoldTextStyle(15, kWhiteColor),
        color: kBlueColor,
        onPressed: () {
          _formKey.currentState!.validate();
        },
      );

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

class UsernameTextField extends StatelessWidget {
  const UsernameTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
        label: 'Username',
        isMandatory: true,
        validator: (value) {
          return value.isValidUsername;
        });
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
      validator: (String? value) {
        return value.isValidPassword;
      },
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
    return CustomTextField(
      label: 'Email',
      keyboardType: TextInputType.emailAddress,
      validator: (String? value) {
        return value.isValidEmail;
      },
      isMandatory: true,
    );
  }
}

class FullNameTextField extends StatelessWidget {
  const FullNameTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      label: 'Full Name',
      isMandatory: true,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.name,
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          RegExp(r"[a-zA-Z]+|\s"),
        )
      ],
      validator: (String? value) {
        return value.isValidFullName;
      },
    );
  }
}
