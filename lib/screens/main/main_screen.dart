import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/components/custom_textfield.dart';
import 'package:travel_app/core/R.dart';
import 'package:travel_app/core/colors.dart';
import 'package:travel_app/core/styles.dart';
import 'package:travel_app/extensions/extensions.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: <Widget>[
              const CircleAvatar(
                backgroundImage: AssetImage(R.mateImage),
                radius: 20,
              ).padding(right: 8),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>['Welcome 👋'.mediumTextStyle(13), 'Elvin'.semiBoldTextStyle(22)],
              ),
              const Spacer(),
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(color: kWhiteColor, borderRadius: kRadius16, boxShadow: [kBlackBoxShadow]),
                child: SvgPicture.asset(
                  R.notification,
                  fit: BoxFit.scaleDown,
                ),
              )
            ],
          ).padding(top: 40, bottom: 59),
          'Where do\nyou want to go?'.boldTextStyle(40),
          CustomTextField(
            controller: TextEditingController(),
            filled: true,
            hintText: 'Search for places...',
            // hintStyle: kSemiBoldTextStyle(15),
            contentPadding: const EdgeInsets.only(left: 20, right: 16, top: 16, bottom: 20),
            suffixIcon: InkWell(
              onTap: () {
                print('search button pressed');
              },
              child: SizedBox(
                width: 32,
                height: 32,
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                        color: kBlueColor, borderRadius: BorderRadius.circular(12), boxShadow: [kBlueBoxShadow]),
                    child: SvgPicture.asset(
                      R.search,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
            ),
          ).padding(top: 32, bottom: 32)
        ],
      ).padding(left: 16, right: 16),
    );
  }
}
