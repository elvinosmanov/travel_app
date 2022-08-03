import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/core/cores.dart';
import 'package:travel_app/extensions/extensions.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(R.logo).padding(bottom: 10),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
