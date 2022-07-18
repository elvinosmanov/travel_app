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
        super(const AuthState.unknown()) {
    on<AuthUserChanged>(_onAuthUserChanged);
    // on<AuthLogoutRequested>(_onAuthLogoutRequested);
    _authUserSubscriptin = _authRepository.user.listen((authUser) {
      // ignore: avoid_print
      print('Auth user: $authUser');
      if (authUser != null) {
        _userRepository.getUser(authUser.uid).listen((user) {

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

  // Future<void> _onAuthLogoutRequested(AuthUserChanged event, Emitter<AuthState> emit) async {
  //   await _authRepository.signOut();
  //   emit(const AuthState.unauthenticated());
  // }

  @override
  Future<void> close() {
    _authUserSubscriptin?.cancel();
    _userSubscription?.cancel();
    return super.close();
  }
}
