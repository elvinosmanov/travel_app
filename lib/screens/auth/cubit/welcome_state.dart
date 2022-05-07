part of 'welcome_cubit.dart';

enum WelcomeStatus { welcome, login, register }

class WelcomeState extends Equatable {
  final WelcomeStatus status;
  final bool agreeTermsCheckBox;
  final bool showPassword;
  final bool isRegisterValidated;
  final String registerPassword;
  const WelcomeState({
    required this.status,
    required this.agreeTermsCheckBox,
    required this.showPassword,
    required this.registerPassword,
    required this.isRegisterValidated,
  });
  factory WelcomeState.initial() => const WelcomeState(
      status: WelcomeStatus.welcome,
      agreeTermsCheckBox: false,
      isRegisterValidated: true,
      registerPassword: '',
      showPassword: true);

  @override
  List<Object> get props => [status, agreeTermsCheckBox, showPassword, isRegisterValidated, registerPassword];

  WelcomeState copyWith({
    WelcomeStatus? status,
    bool? agreeTermsCheckBox,
    bool? showPassword,
    bool? isTermsAccepted,
    String? registerPassword,
  }) {
    return WelcomeState(
      status: status ?? this.status,
      agreeTermsCheckBox: agreeTermsCheckBox ?? this.agreeTermsCheckBox,
      showPassword: showPassword ?? this.showPassword,
      isRegisterValidated: isTermsAccepted ?? this.isRegisterValidated,
      registerPassword: registerPassword ?? this.registerPassword,
    );
  }
}
