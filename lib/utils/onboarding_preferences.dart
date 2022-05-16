import 'package:shared_preferences/shared_preferences.dart';

class OnboardingPreferences {
  static late SharedPreferences _preferences;
  static const _keyOnboarding = 'onboarding';
  static Future init() async => _preferences = await SharedPreferences.getInstance();
  static Future setOnceShowOnboarding() async => await _preferences.setBool(_keyOnboarding, true);

  static bool? getOnboarding() => _preferences.getBool(_keyOnboarding);
}
