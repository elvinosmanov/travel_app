import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:travel_app/repositories/auth_repository.dart';

import '../../models/user.dart';
import '../../repositories/user_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;
  StreamSubscription<auth.User?>? _authUserSubscriptin;
  StreamSubscription<UserModel?>? _userSubscription;

  AuthBloc({required AuthRepository authRepository, required UserRepository userRepository})
      : _authRepository = AuthRepository(),
        _userRepository = UserRepository(),
        super(const AuthState.unknown())  {
          
    on<AuthUserChanged>(_onAuthUserChanged);
    // on<AuthLogoutRequested>(_onAuthLogoutRequested);

    _authUserSubscriptin = _authRepository.user.listen((authUser) async {
      // ignore: avoid_print
    // await Future.delayed(const Duration(seconds: 2 )); print('Auth user: $authUser');
      if (authUser != null) {
        _userRepository.getUser(authUser.uid).listen((user) {
          print(user);
          add(AuthUserChanged(authUser: authUser, user: user));
        });
      } else {
        add(AuthUserChanged(authUser: authUser));
      }
    });
  }

  void _onAuthUserChanged(AuthUserChanged event, Emitter<AuthState> emit) {
    event.authUser != null
        ? emit(AuthState.authenticated(authUser: event.authUser!, user: event.user!))
        : emit(const AuthState.unauthenticated());
  }

  // void _onAuthLogoutRequested(AuthUserChanged event, Emitter<AuthState> emit) {
  //    _authRepository.signOut();
  //   emit(const AuthState.unauthenticated());
  // }
  Future<void> changeCurrentUserPassword(String currentPassword, String newPassword) async {
    final user = _authRepository.currentUser!;
    final credential = auth.EmailAuthProvider.credential(email: user.email!, password: currentPassword);
    try {
      await user.reauthenticateWithCredential(credential);
      user.updatePassword(newPassword).then((value) => null);
    } on auth.FirebaseAuthException catch (e) {
      print("You can't change the Password" + e.toString());
    }
  }

  Future<void> logout() async {
    emit(const AuthState.loading());
    await _authRepository.signOut();
  }

  @override
  Future<void> close() {
    _authUserSubscriptin?.cancel();
    _userSubscription?.cancel();
    return super.close();
  }
}
