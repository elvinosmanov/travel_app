import 'package:flutter/material.dart';
import 'package:travel_app/screens/onboarding/onboarding.dart';
import 'package:travel_app/screens/welcome/welcome_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Onboarding(),
    );
  }
}
