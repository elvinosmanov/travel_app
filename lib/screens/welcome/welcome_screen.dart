import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:travel_app/core/R.dart';
import 'package:travel_app/core/colors.dart';
import 'package:travel_app/extensions/extensions.dart';
import 'package:travel_app/cubit/welcome_cubit.dart';
import 'package:travel_app/screens/welcome/widgets/login_bottom.dart';
import 'package:travel_app/screens/welcome/widgets/register_bottom.dart';
import 'package:travel_app/screens/welcome/widgets/welcome_bottom.dart';
import '../../core/constants.dart';
import '../../core/styles.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late Image myImage;
  @override
  void initState() {
    super.initState();
    myImage = Image.asset(
      R.welcomeBackground,
      fit: BoxFit.cover,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(myImage.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildBackgroundImage(context),
        _buildScaffold(),
      ],
    );
  }

  Scaffold _buildScaffold() {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.transparent,
      body: BlocProvider(
        create: (context) => WelcomeCubit(),
        child: Stack(
          children: [
            _buildLogo().padding(top: 70),
            const _BottomSheets(),
          ],
        ),
      ),
    );
  }

  Align _buildLogo() {
    return Align(
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Image.asset(R.logo).padding(right: 16), appName.boldTextStyle(36, kWhiteColor)],
      ),
    );
  }

  SizedBox _buildBackgroundImage(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: FadeInImage(
        placeholder: MemoryImage(kTransparentImage),
        fit: BoxFit.cover,
        fadeInDuration: const Duration(milliseconds: 300),
        image: const AssetImage(R.welcomeBackground),
      ),
    );
  }
}

class _BottomSheets extends StatelessWidget {
  const _BottomSheets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 150),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(color: kWhiteColor, borderRadius: kRadius16),
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          padding: const EdgeInsets.all(25),
          child: BlocBuilder<WelcomeCubit, WelcomeState>(
            buildWhen: (previous, current) => previous.status != current.status,
            builder: (context, state) {
              switch (state.status) {
                case WelcomeStatus.welcome:
                  return const WelcomeBottomContainer();
                case WelcomeStatus.login:
                  return const LoginBottomContainer();
                case WelcomeStatus.register:
                  return const RegisterBottomContainer();
              }
            },
          ),
        ),
      ),
    );
  }
}
