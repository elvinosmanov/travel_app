import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/bloc/auth/auth_bloc.dart';
import 'package:travel_app/components/custom_back_button.dart';
import 'package:travel_app/components/custom_textfield.dart';
import 'package:travel_app/core/constants.dart';
import 'package:travel_app/core/cores.dart';
import 'package:travel_app/extensions/extensions.dart';
import 'package:travel_app/screens/settings/widgets/custom_submit_button.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final secondNewPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16, top: defaultTopPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomBackButton(
                onPressed: () {
                  context.router.pop();
                },
              ).padding(bottom: 16),
              _buildNameTextField(
                  name: 'Current Password', hintText: 'xxxxxxxxx', controller: currentPasswordController),
              _buildNameTextField(name: 'New Password', hintText: 'New Password', controller: newPasswordController),
              _buildNameTextField(
                  name: 'New Password, again',
                  hintText: 'New Password, again',
                  controller: secondNewPasswordController),
              CustomSubmitButton(
                text: 'Save Changes',
                textColor: kWhiteColor,
                onPressed: () {
                  context
                      .read<AuthBloc>()
                      .changeCurrentUserPassword(currentPasswordController.text, newPasswordController.text);
                },
              ).padding(top: 32)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNameTextField(
      {required String name, required String hintText, required TextEditingController controller}) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          name.mediumTextStyle(15).padding(bottom: 6),
          CustomTextField(
            controller: controller,
            hintText: hintText,
          ),
        ],
      ),
    );
  }
}
