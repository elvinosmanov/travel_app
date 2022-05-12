part of 'welcome_cubit.dart';

enum WelcomeStatus { welcome, login, register }

class WelcomeState extends Equatable {
  final WelcomeStatus status;
  final bool agreeTermsCheckBox;
  final bool showRegisterPassword;
  final bool showLoginPassword;
  final bool isTermsAccepted;
  final String registerPassword;
  final String loginPassword;
  const WelcomeState({
    required this.showLoginPassword,
    required this.loginPassword,
    required this.status,
    required this.agreeTermsCheckBox,
    required this.showRegisterPassword,
    required this.registerPassword,
    required this.isTermsAccepted,
  });
  factory WelcomeState.initial() => const WelcomeState(
      status: WelcomeStatus.welcome,
      agreeTermsCheckBox: false,
      isTermsAccepted: true,
      registerPassword: '',
      loginPassword: '',
      showLoginPassword: false,
      showRegisterPassword: false);

  @override
  List<Object> get props => [
        status,
        agreeTermsCheckBox,
        showRegisterPassword,
        isTermsAccepted,
        registerPassword,
        loginPassword,
        showLoginPassword
      ];

  WelcomeState copyWith({
    WelcomeStatus? status,
    bool? agreeTermsCheckBox,
    bool? showRegisterPassword,
    bool? showLoginPassword,
    bool? isTermsAccepted,
    String? registerPassword,
    String? loginPassword,
  }) {
    return WelcomeState(
      status: status ?? this.status,
      agreeTermsCheckBox: agreeTermsCheckBox ?? this.agreeTermsCheckBox,
      showRegisterPassword: showRegisterPassword ?? this.showRegisterPassword,
      showLoginPassword: showLoginPassword ?? this.showLoginPassword,
      isTermsAccepted: isTermsAccepted ?? this.isTermsAccepted,
      registerPassword: registerPassword ?? this.registerPassword,
      loginPassword: loginPassword ?? this.loginPassword,
    );
  }
}
