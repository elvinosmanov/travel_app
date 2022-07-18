import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:travel_app/core/constants.dart';
import 'package:travel_app/core/cores.dart';
import 'package:travel_app/cubit/user/user_cubit.dart';
import 'package:travel_app/extensions/extensions.dart';
import 'package:travel_app/routes/router.gr.dart';
import 'package:travel_app/screens/settings/widgets/settings_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTopNavigation().padding(bottom: defaultTopPadding),
        Expanded(
          child: ListView(
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.all(0),
            children: [
              _buildUserInformation().padding(left: 16, right: 16, bottom: 32),
              'Account'.semiBoldTextStyle(18).padding(left: 16, bottom: 4),
              SettingsBar(
                  title: 'Personal Informations',
                  onPressed: () {
                    context.router.push(const PersonalInformationsRoute());
                  }),
              SettingsBar(
                  title: 'Change Password',
                  onPressed: () {
                    context.router.push(const ChangePasswordRoute());
                  }),
              'Support'.semiBoldTextStyle(18).padding(left: 16, right: 16, top: 14, bottom: 4),
              SettingsBar(
                  title: 'Report a Bug',
                  onPressed: () {
                    context.router.push(const ReportBugRoute());
                  }),
              SettingsBar(
                  title: 'Privacy policy',
                  onPressed: () {
                    context.router.push(const PrivacyPolicyRoute());
                  }),
              SettingsBar(
                  title: 'Terms of services',
                  onPressed: () {
                    context.router.push(const PrivacyPolicyRoute());
                  }),
              'Support'.semiBoldTextStyle(18).padding(left: 16, right: 16, top: 14, bottom: 4),
              SettingsBar(
                  title: 'Language',
                  flagIconName: R.usFlag,
                  onPressed: () {
                    context.router.push(const LanguagesRoute());
                  }),
              SettingsBar(
                  hasIcon: false,
                  title: 'Log out',
                  color: kRedColor,
                  onPressed: () {
                    context.read<UserCubit>().logout();
                  }),
            ],
          ),
        ),
      ],
    );
  }

  Row _buildUserInformation() {
    return Row(
      children: <Widget>[
        const CircleAvatar(
          backgroundImage: AssetImage(R.mateImage),
          radius: 75 / 2,
        ).padding(right: 24),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            'Elvin Osmanov'.mediumTextStyle(15).padding(bottom: 6),
            'elvinosmanov@gmail.com'.mediumTextStyle(15, kDarkGreyColor)
          ],
        )
      ],
    );
  }

  Widget _buildTopNavigation() {
    return Padding(
        padding: const EdgeInsets.only(top: defaultTopPadding),
        child: Center(
          child: 'Settings'.boldTextStyle(15),
        ));
  }
}
