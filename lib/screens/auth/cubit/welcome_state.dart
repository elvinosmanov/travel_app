part of 'welcome_cubit.dart';

enum WelcomeStatus { welcome, login, register }

class WelcomeState extends Equatable {
  final WelcomeStatus status;
  
  const WelcomeState(this.status);
  const WelcomeState.inittial():status=WelcomeStatus.welcome;

  @override
  List<Object?> get props => [status];

  WelcomeState copyWith({
    WelcomeStatus? status,
  }) {
    return WelcomeState(
      status ?? this.status,
    );
  }
}
