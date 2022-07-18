import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'welcome_state.dart';

class WelcomeCubit extends Cubit<WelcomeState> {
  WelcomeCubit() : super(WelcomeState.initial());
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  changeStatus(WelcomeStatus value) {
    if (value == WelcomeStatus.welcome) {
      emit(state.copyWith(status: value, showLoginPassword: false, showRegisterPassword: false));
      return;
    }
    emit(state.copyWith(status: value));
  }

  changeCheckBox() {
    emit(state.copyWith(agreeTermsCheckBox: !state.agreeTermsCheckBox));
  }

  changeShowPassword({required bool isRegister}) {
    if (isRegister) {
      emit(state.copyWith(showRegisterPassword: !state.showRegisterPassword));
    } else {
      emit(state.copyWith(showLoginPassword: !state.showLoginPassword));
    }
  }

  passwordText({String? value, required bool isRegister}) {
    if (isRegister) {
      emit(state.copyWith(registerPassword: value));
    } else {
      emit(state.copyWith(loginPassword: value));
    }
  }

 bool checkRegisterValidation() {
    bool isVal = registerFormKey.currentState!.validate();
    if (!state.agreeTermsCheckBox) {
      emit(state.copyWith(isTermsAccepted: false));
      return false;
    }
    emit(state.copyWith(isTermsAccepted: true));
    if (isVal) {
      emit(state.copyWith(loginStatus: LoginStatus.success));
      return true;
    }else {
      emit(state.copyWith(loginStatus: LoginStatus.noValidation));
      return false;
    }
  }

  bool  checkLoginValidation() {
    if (state.loginStatus == LoginStatus.loading) return false;
    emit(state.copyWith(loginStatus: LoginStatus.loading));
    bool isVal = loginFormKey.currentState!.validate();
    if (isVal) {
      emit(state.copyWith(loginStatus: LoginStatus.success));
      return true;
    } else {
      emit(state.copyWith(loginStatus: LoginStatus.noValidation));
      return false;
    }
  }
}
