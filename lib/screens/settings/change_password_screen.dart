import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:travel_app/components/custom_back_button.dart';
import 'package:travel_app/components/custom_textfield.dart';
import 'package:travel_app/core/constants.dart';
import 'package:travel_app/core/cores.dart';
import 'package:travel_app/extensions/extensions.dart';
import 'package:travel_app/screens/settings/widgets/custom_submit_button.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: defaultTopPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CustomBackButton(
            onPressed: () {
              context.router.pop();
            },
          ).padding(bottom: 16),
          _buildNameTextField(name: 'Current Password', hintText: 'xxxxxxxxx'),
          _buildNameTextField(name: 'New Password', hintText: 'New Password'),
          _buildNameTextField(name: 'New Password, again', hintText: 'New Password, again'),
          CustomSubmitButton(
            text: 'Save Changes',
            textColor: kWhiteColor,
            onPressed: () {},
          ).padding(top: 32)
        ],
      ),
    );
  }

//TODO: String textFieldText for now
  Widget _buildNameTextField({required String name, required String hintText}) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          name.mediumTextStyle(15).padding(bottom: 6),
          CustomTextField(
            controller: TextEditingController(),
            hintText: hintText,
          ),
        ],
      ),
    );
  }
}
