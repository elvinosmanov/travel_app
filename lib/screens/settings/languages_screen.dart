import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/core/cores.dart';
import 'package:travel_app/extensions/text_style_extension.dart';
import 'package:travel_app/extensions/widget_padding_extension.dart';
import 'package:travel_app/screens/settings/widgets/custom_submit_button.dart';
import 'package:travel_app/screens/settings/widgets/settings_bar.dart';

import '../../components/custom_back_button.dart';
import '../../core/constants.dart';

class LanguagesScreen extends StatelessWidget {
  const LanguagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CustomBackButton(
          onPressed: () {
            context.router.pop();
          },
        ).padding(left: 16.0, right: 16, top: defaultTopPadding),
        'Choose Language'.semiBoldTextStyle(18).padding(
              top: 32,
              bottom: 4,
              left: 16.0,
              right: 16,
            ),
        const SettingsBar(title: 'Azerbaijani', flagIconName: R.azFlag, hasSelected: false),
        const SettingsBar(title: 'English', flagIconName: R.usFlag),
        const SettingsBar(title: 'Russian', flagIconName: R.ruFlag, hasSelected: false),
        const SettingsBar(title: 'Turkish', flagIconName: R.trFlag, hasSelected: false),
        CustomSubmitButton(
          text: 'Save Changes',
          textColor: kWhiteColor,
          onPressed: () {},
        ).padding(top: 32, right: 16,left: 16)
      ],
    );
  }
}
