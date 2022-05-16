import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/core/R.dart';
import 'package:travel_app/core/colors.dart';
import 'package:travel_app/core/styles.dart';
import 'package:travel_app/extensions/extensions.dart';
import 'package:travel_app/routes/router.gr.dart';
import 'package:travel_app/utils/onboarding_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [_buildPageViewBuilder(), _buildButton(), _buildDotIndicator()],
      ),
    );
  }

  Align _buildDotIndicator() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ...List.generate(data.length, (index) => DotIndicator(isActive: index == _pageIndex).padding(right: 16))
        ],
      ).padding(bottom: 40),
    );
  }

  Align _buildButton() {
    return Align(
      alignment: Alignment.bottomRight,
      child: InkWell(
        onTap: () {
          if (_pageIndex != data.length - 1) {
            _pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
          } else {
            OnboardingPreferences.setOnceShowOnboarding();
            debugPrint('This is last page');
            context.router.push(const WelcomeRoute());
          }
        },
        child: Container(
          width: 76,
          height: 76,
          margin: const EdgeInsets.only(right: 20, bottom: 100),
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: kRadius16, boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.white.withOpacity(0.1), spreadRadius: 8, offset: const Offset(0.0, 0.0))
          ]),
          child: Align(
            alignment: Alignment.center,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: kBlueColor,
                borderRadius: kRadius16,
              ),
              child: SvgPicture.asset(
                _pageIndex == data.length - 1 ? R.goRight : R.done,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
      ),
    );
  }

  PageView _buildPageViewBuilder() {
    return PageView.builder(
      controller: _pageController,
      onPageChanged: (index) {
        setState(() {
          _pageIndex = index;
        });
      },
      itemCount: data.length,
      itemBuilder: (context, index) {
        return OnboardContent(imageNamePath: data[index].image, text: data[index].text);
      },
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: 16,
      height: 16,
      decoration: isActive
          ? const BoxDecoration(shape: BoxShape.circle, color: kBlueColor)
          : BoxDecoration(shape: BoxShape.circle, border: Border.all(color: kWhiteColor, width: 1)),
    );
  }
}

class Onboard {
  final String image;
  final String text;
  Onboard({
    required this.image,
    required this.text,
  });
}

final List<Onboard> data = [
  Onboard(image: R.flagInterestImage, text: 'Explore your\nInterests'),
  Onboard(image: R.mateImage, text: 'Find your\nTravel Mate'),
  Onboard(image: R.tripImage, text: 'Plan your\nTrip'),
];

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    Key? key,
    required this.imageNamePath,
    required this.text,
  }) : super(key: key);
  final String imageNamePath;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(imageNamePath), fit: BoxFit.cover),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [kBlackColor, kBlackColor.withOpacity(0.7), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.center,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: text.mediumTextStyle(40, kWhiteColor).padding(left: 20, bottom: 110),
        ),
      ],
    );
  }
}
