import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/components/custom_back_button.dart';
import 'package:travel_app/components/custom_textfield.dart';
import 'package:travel_app/core/constants.dart';
import 'package:travel_app/core/cores.dart';
import 'package:travel_app/extensions/extensions.dart';
import 'package:travel_app/screens/settings/widgets/custom_submit_button.dart';

class PersonalInformationsScreen extends StatelessWidget {
  const PersonalInformationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16, top: defaultTopPadding),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CustomBackButton(
                  onPressed: () {
                    context.router.pop();
                  },
                ).padding(bottom: 16),
                _buildNameTextField(name: 'Name', textFieldText: 'Elvin'),
                _buildNameTextField(name: 'Surname', textFieldText: 'Osmanov'),
                _buildNameTextField(name: 'Phone number', textFieldText: '+994 55 426 19 98'),
                _buildNameTextField(name: 'Location', textFieldText: 'Baku, Azerbaijan'),
                CustomSubmitButton(
                  text: 'Save Changes',
                  textColor: kWhiteColor,
                  onPressed: () {},
                ).padding(top: 32)
              ],
            ),
          ),
        ),
      ),
    );
  }

//TODO: String textFieldText for now
  Widget _buildNameTextField({required String name, required String textFieldText}) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          name.mediumTextStyle(15).padding(bottom: 6),
          CustomTextField(controller: TextEditingController(text: textFieldText)),
        ],
      ),
    );
  }
}
