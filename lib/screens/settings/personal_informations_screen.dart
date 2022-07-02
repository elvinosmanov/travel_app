import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/components/custom_back_button.dart';
import 'package:travel_app/components/custom_textfield.dart';
import 'package:travel_app/core/constants.dart';
import 'package:travel_app/core/cores.dart';
import 'package:travel_app/cubit/user/user_cubit.dart';
import 'package:travel_app/extensions/extensions.dart';
import 'package:travel_app/screens/settings/widgets/custom_submit_button.dart';

class PersonalInformationsScreen extends StatefulWidget {
  const PersonalInformationsScreen({Key? key}) : super(key: key);

  @override
  State<PersonalInformationsScreen> createState() => _PersonalInformationsScreenState();
}

class _PersonalInformationsScreenState extends State<PersonalInformationsScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16, top: defaultTopPadding),
          child: SingleChildScrollView(
            child: BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CustomBackButton(
                      onPressed: () {
                        context.router.pop();
                      },
                    ).padding(bottom: 16),
                    _buildNameTextField(
                        name: 'Name',
                        textEditingController: nameController..text = state.userModel.fullName.split(" ")[0]),
                    _buildNameTextField(
                        name: 'Surname',
                        textEditingController: surnameController..text = state.userModel.fullName.split(" ")[1]),
                    // _buildNameTextField(
                    //     name: 'Username', textEditingController: usernameController..text = state.userModel.username),
                    _buildNameTextField(
                        name: 'Location',
                        textEditingController: locationController..text = state.userModel.locationName),
                    CustomSubmitButton(
                      text: 'Save Changes',
                      textColor: kWhiteColor,
                      onPressed: () {
                        context.read<UserCubit>().updateUserInformation(
                            '${nameController.text} ${surnameController.text}',
                            locationController.text);
                      },
                    ).padding(top: 32)
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

//TODO: String textFieldText for now
  Widget _buildNameTextField({required String name, required TextEditingController textEditingController}) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          name.mediumTextStyle(15).padding(bottom: 6),
          CustomTextField(controller: textEditingController),
        ],
      ),
    );
  }
}
