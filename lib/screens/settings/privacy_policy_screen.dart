import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/components/custom_back_button.dart';
import 'package:travel_app/core/constants.dart';
import 'package:travel_app/extensions/extensions.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

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
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  "Privacy Policy of $appName".semiBoldTextStyle(15).padding(top: 16, bottom: 16),
                ],
              ),
              "Among the types of Personal Data that this Application collects, by itself or through third parties, there are: company name.\nComplete details on each type of Personal Data collected are provided in the dedicated sections of this privacy policy or by specific explanation texts displayed prior to the Data collection.\nPersonal Data may be freely provided by the User, or, in case of Usage Data, collected automatically when using this Application.\nUnless specified otherwise, all Data requested by this Application is mandatory and failure to provide this Data may make it impossible for this Application to provide its services. In cases where this Application specifically states that some Data is not mandatory, Users are free not to communicate this Data without consequences to the availability or the functioning of the Service.\n\nUsers who are uncertain about which Personal Data is mandatory are welcome to contact the Owner.\nAny use of Cookies – or of other tracking tools – by this Application or by the owners of third-party services used by this Application serves the purpose of providing the Service required by the User, in addition to any other purposes described in the present document and in the Cookie Policy, if available.\n\nUsers are responsible for any third-party Personal Data obtained, published or shared through this Application and confirm that they have the third party's consent to provide the Data to the Owner."
                  .regularTextStyle(12)
            ],
          ),
        ),
      ),
    );
  }
}
