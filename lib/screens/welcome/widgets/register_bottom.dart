import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/components/custom_back_button.dart';
import 'package:travel_app/components/custom_button.dart';
import 'package:travel_app/components/custom_checkbox.dart';
import 'package:travel_app/components/custom_textfield.dart';
import 'package:travel_app/components/text_between_line.dart';
import 'package:travel_app/core/styles.dart';
import 'package:travel_app/cubit/user/user_cubit.dart';
import 'package:travel_app/extensions/extensions.dart';
import 'package:travel_app/cubit/welcome/welcome_cubit.dart';
import '../../../core/R.dart';
import '../../../core/colors.dart';

class RegisterBottomContainer extends StatefulWidget {
  const RegisterBottomContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterBottomContainer> createState() => _RegisterBottomContainerState();
}

class _RegisterBottomContainerState extends State<RegisterBottomContainer> {
  final double gap = 10.0;
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;
  late final TextEditingController fullNameController;
  late final TextEditingController emailController;
  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    fullNameController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.disabled,
      key: context.read<WelcomeCubit>().registerFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CustomBackButton(
            onPressed: () {
              context.read<WelcomeCubit>().changeStatus(WelcomeStatus.welcome);
            },
          ).padding(bottom: 16),
          'Register new account'.heading1(),
          'Please sign up to your account'.regularTextStyle(14).padding(top: 6, bottom: 20),
          FullNameTextField(
            controller: fullNameController,
          ).padding(bottom: gap),
          UsernameTextField(
            controller: usernameController,
          ),
          PasswordTextField(
            controller: passwordController,
          ).padding(top: gap, bottom: gap),
          EmailTextField(
            controller: emailController,
          ),
          _buildTermAndConditions().padding(top: 16, bottom: 25),
          if (context.select((WelcomeCubit c) => !c.state.isTermsAccepted))
            Center(
                child: 'Please read and accept Term and Conditions'.regularTextStyle(11, kRedColor).padding(bottom: 5)),
          _buildSignUpButton(),
          const TextBetweenLine(text: 'Or continue with').padding(top: 55, bottom: 20),
          _buildFacebookGoogleButtons()
        ],
      ),
    );
  }

  CustomButton _buildSignUpButton() => CustomButton.text(
        text: 'Sign Up'.semiBoldTextStyle(15, kWhiteColor),
        color: kBlueColor,
        onPressed: () {
          final result = context.read<WelcomeCubit>().checkRegisterValidation();
          if (result) {
            context.read<UserCubit>().registerWithCredentials(
                  emailController.text,
                  passwordController.text,
                  usernameController.text,
                  fullNameController.text,
                );
          }
        },
      );

  Row _buildTermAndConditions() {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      BlocBuilder<WelcomeCubit, WelcomeState>(
        buildWhen: (previous, current) => previous.agreeTermsCheckBox != current.agreeTermsCheckBox,
        builder: (context, state) {
          return CustomCheckBox(
                  onPressed: () {
                    context.read<WelcomeCubit>().changeCheckBox();
                  },
                  value: state.agreeTermsCheckBox)
              .padding(right: 12);
        },
      ),
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
    required this.controller,
  }) : super(key: key);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
        label: 'Username',
        controller: controller,
        isMandatory: true,
        validator: (value) {
          return value?.isValidUsername;
        });
  }
}

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WelcomeCubit, WelcomeState>(
      builder: (context, state) {
        return CustomTextField(
            label: 'Password',
            controller: controller,
            isMandatory: true,
            onChanged: (value) {
              context.read<WelcomeCubit>().passwordText(value: value, isRegister: true);
            },
            obscureText: !state.showRegisterPassword,
            validator: (String? value) {
              return value?.isValidPassword;
            },
            suffixIcon: state.registerPassword.isNotEmpty
                ? GestureDetector(
                    onTap: () {
                      context.read<WelcomeCubit>().changeShowPassword(isRegister: true);
                    },
                    child: SvgPicture.asset(
                      state.showRegisterPassword ? R.closedEye : R.openEye,
                      fit: BoxFit.scaleDown,
                    ),
                  )
                : null);
      },
    );
  }
}

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      label: 'Email',
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.emailAddress,
      validator: (String? value) {
        return value?.isValidEmail;
      },
      isMandatory: true,
    );
  }
}

class FullNameTextField extends StatelessWidget {
  const FullNameTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
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
        return value?.isValidFullName;
      },
    );
  }
}
