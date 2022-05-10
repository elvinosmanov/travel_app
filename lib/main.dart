import 'package:flutter/material.dart';
import 'package:travel_app/screens/onboarding/onboarding.dart';
import 'package:travel_app/screens/welcome/welcome_screen.dart';
import 'package:travel_app/utils/onboarding_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await OnboardingPreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: navigationPage(context),
    );
  }
}
 Widget navigationPage(BuildContext context) {
   bool? isExistingUser = OnboardingPreferences.getOnboarding();
   if (isExistingUser == null) {
      return const Onboarding();
   } else {
       return const WelcomeScreen();
   }
}