import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/components/custom_button.dart';
import 'package:travel_app/components/custom_textfield.dart';
import 'package:travel_app/components/text_between_line.dart';
import 'package:travel_app/core/styles.dart';
import 'package:travel_app/cubit/welcome/welcome_cubit.dart';
import 'package:travel_app/extensions/extensions.dart';
import 'package:travel_app/routes/router.gr.dart';
import '../../../components/custom_back_button.dart';
import '../../../core/R.dart';
import '../../../core/colors.dart';
import 'package:auto_route/auto_route.dart';

class LoginBottomContainer extends StatefulWidget {
  const LoginBottomContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginBottomContainer> createState() => _LoginBottomContainerState();
}

class _LoginBottomContainerState extends State<LoginBottomContainer> {
  late final TextEditingController passwordController;
  late final TextEditingController emailController;
  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.disabled,
      key: context.read<WelcomeCubit>().loginFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CustomBackButton(
            onPressed: () {
              context.read<WelcomeCubit>().changeStatus(WelcomeStatus.welcome);
            },
          ).padding(bottom: 16),
          'Welcome Back'.heading1(),
          'Please log in to your account'.regularTextStyle(14).padding(top: 6, bottom: 20),
          EmailTextField(
            controller: emailController,
          ),
          PasswordTextField(
            controller: passwordController,
          ).padding(top: 10, bottom: 10),
          _buildForgetPasswordButton(),
          _buildSignInButton().padding(bottom: 20, top: 17),
          _builNoAccountButton(),
          const TextBetweenLine(text: 'Or continue with').padding(top: 17, bottom: 20),
          _buildFacebookGoogleButtons()
        ],
      ),
    );
  }

  Row _buildForgetPasswordButton() =>
      Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>['Forgot Password?'.mediumTextStyle(13)]);

  Widget _buildSignInButton() => BlocConsumer<WelcomeCubit, WelcomeState>(
    listener: (context, state) {
      if(state.loginStatus==LoginStatus.success){
        context.router.push(const NavigationRoute());
      }
    },
        builder: (context, state) {
          return CustomButton.text(
            isLoading: state.loginStatus == LoginStatus.loading,
            text: 'Sign In'.semiBoldTextStyle(15, kWhiteColor),
            color: kBlueColor,
            onPressed: () {
              context.read<WelcomeCubit>().checkLoginValidation();
              
            },
          );
        },
      );

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
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    context.read<WelcomeCubit>().changeStatus(WelcomeStatus.register);
                  }),
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
              context.read<WelcomeCubit>().passwordText(value: value, isRegister: false);
            },
            obscureText: !state.showLoginPassword,
            validator: (String? value) {
              return value?.isValidPassword;
            },
            suffixIcon: state.loginPassword.isNotEmpty
                ? GestureDetector(
                    onTap: () {
                      context.read<WelcomeCubit>().changeShowPassword(isRegister: false);
                    },
                    child: SvgPicture.asset(
                      state.showLoginPassword ? R.closedEye : R.openEye,
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
      label: 'Email address',
      isMandatory: true,
      controller: controller,
      validator: (String? value) {
        return value?.isValidEmail;
      },
    );
  }
}
