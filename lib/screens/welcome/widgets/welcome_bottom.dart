import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/components/custom_button.dart';
import 'package:travel_app/components/text_between_line.dart';
import 'package:travel_app/extensions/extensions.dart';
import 'package:travel_app/cubit/welcome_cubit.dart';

import '../../../core/R.dart';
import '../../../core/colors.dart';
import '../../../core/constants.dart';

class WelcomeBottomContainer extends StatelessWidget {
  const WelcomeBottomContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        'Welcome to $appName'.heading1(),
        'Live life with no excuses, travel with no regret'.regularTextStyle(14).padding(top: 6),
        _buildGoogleButton(),
        _buildFacebookButton().padding(top: 10),
        _buildGuestButton(),
        const TextBetweenLine(text: 'Or'),
        _buildSignButtons(context).padding(top: 20)
      ],
    );
  }

  Center _buildGuestButton() {
    return Center(
      child: 'Continue as guest'
          .mediumTextStyle(14)
          .copyWith(
            const TextStyle(decoration: TextDecoration.underline),
          )
          .padding(top: 16, bottom: 17),
    );
  }

  CustomButton _buildFacebookButton() {
    return CustomButton(
      onPressed: () {},
      color: kFacebookBlueColor,
      iconName: R.facebookIcon,
      text: 'Continue with Facebook'.semiBoldTextStyle(15, kWhiteColor),
    );
  }

  Center _buildGoogleButton() {
    return Center(
      child: CustomButton(
        onPressed: () {},
        color: kGoogleRedColor,
        iconName: R.googleIcon,
        text: 'Continue with Google'.semiBoldTextStyle(15, kWhiteColor),
      ).padding(top: 30),
    );
  }

  Row _buildSignButtons(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          child: CustomButton.text(
            onPressed: () {
              context.read<WelcomeCubit>().changeStatus(WelcomeStatus.login);
            },
            color: kBlueColor,
            text: 'Sign In'.semiBoldTextStyle(15, kWhiteColor),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: CustomButton.text(
            onPressed: () {
              context.read<WelcomeCubit>().changeStatus(WelcomeStatus.register);
            },
            color: kBlackColor,
            text: 'Sign Up'.semiBoldTextStyle(15, kWhiteColor),
          ),
        )
      ],
    );
  }
}
