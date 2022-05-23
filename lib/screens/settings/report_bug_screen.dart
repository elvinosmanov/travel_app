import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/components/custom_back_button.dart';
import 'package:travel_app/components/custom_textfield.dart';
import 'package:travel_app/core/constants.dart';
import 'package:travel_app/core/cores.dart';
import 'package:travel_app/extensions/extensions.dart';
import 'package:travel_app/screens/settings/widgets/custom_submit_button.dart';

class ReportBugScreen extends StatelessWidget {
  const ReportBugScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: defaultTopPadding / 2),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: kLightGreyColor_1, border: Border(bottom: BorderSide(color: Colors.black12, width: 0.5))),
            padding: const EdgeInsets.only(bottom: defaultTopPadding / 2),
            child: Row(
              children: [
                CustomBackButton(
                  onPressed: () {
                    context.router.pop();
                  },
                ).padding(left: 16),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(left: 16.0, right: 16, top: 32),
              physics: const ClampingScrollPhysics(),
              children: <Widget>[
                'Title'.mediumTextStyle(15).padding(bottom: 6),
                CustomTextField(
                  controller: TextEditingController(),
                  hintText: 'Title...',
                ),
                'Problem'.mediumTextStyle(15).padding(top: 16, bottom: 8),
                CustomTextField(
                  controller: TextEditingController(),
                  hintText: 'Please write problem detailed...',
                  textInputAction: TextInputAction.newline,
                  maxLines: 10,
                ),
                'Screenshot'.mediumTextStyle(15).padding(top: 16, bottom: 8),
                _buildAttachFileButton(),
                'Thanks for helping us!'.mediumTextStyle(15).padding(top: 16, bottom: 8),
                Text(reportText, textAlign: TextAlign.justify, style: kRegularTextStyle(14)),
                const CustomSubmitButton(
                  text: 'Submit Report',
                  textColor: kWhiteColor,
                  backgroundColor: kBlueColor,
                ).padding(top: 32, bottom: 16)
              ],
            ),
          ),
        ],
      ),
    );
  }

  ElevatedButton _buildAttachFileButton() {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: SvgPicture.asset(R.attach),
      label: 'Attach a file'.mediumTextStyle(13),
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(2),
        overlayColor: MaterialStateProperty.all(Colors.black12),
        padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
        backgroundColor: MaterialStateProperty.all(kWhiteColor),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: kRadius8)),
      ),
    );
  }
}
