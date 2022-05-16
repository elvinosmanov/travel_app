part of 'welcome_cubit.dart';

enum WelcomeStatus { welcome, login, register }

enum LoginStatus { initial, loading, success, noValidation, error }

class WelcomeState extends Equatable {
  final WelcomeStatus status;
  final LoginStatus loginStatus;
  final bool agreeTermsCheckBox;
  final bool showRegisterPassword;
  final bool showLoginPassword;
  final bool isTermsAccepted;
  final String registerPassword;
  final String loginPassword;
  const WelcomeState({
    required this.status,
    required this.loginStatus,
    required this.agreeTermsCheckBox,
    required this.showRegisterPassword,
    required this.showLoginPassword,
    required this.isTermsAccepted,
    required this.registerPassword,
    required this.loginPassword,
  });
  factory WelcomeState.initial() => const WelcomeState(
      status: WelcomeStatus.welcome,
      loginStatus: LoginStatus.initial,
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
        showLoginPassword,
        loginStatus
      ];

  WelcomeState copyWith({
    WelcomeStatus? status,
    LoginStatus? loginStatus,
    bool? agreeTermsCheckBox,
    bool? showRegisterPassword,
    bool? showLoginPassword,
    bool? isTermsAccepted,
    String? registerPassword,
    String? loginPassword,
  }) {
    return WelcomeState(
      status: status ?? this.status,
      loginStatus: loginStatus ?? this.loginStatus,
      agreeTermsCheckBox: agreeTermsCheckBox ?? this.agreeTermsCheckBox,
      showRegisterPassword: showRegisterPassword ?? this.showRegisterPassword,
      showLoginPassword: showLoginPassword ?? this.showLoginPassword,
      isTermsAccepted: isTermsAccepted ?? this.isTermsAccepted,
      registerPassword: registerPassword ?? this.registerPassword,
      loginPassword: loginPassword ?? this.loginPassword,
    );
  }
}
