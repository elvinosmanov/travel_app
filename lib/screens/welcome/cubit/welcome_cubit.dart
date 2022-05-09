import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'welcome_state.dart';

class WelcomeCubit extends Cubit<WelcomeState> {
  WelcomeCubit() : super(WelcomeState.initial());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  changeStatus(WelcomeStatus value) {
    emit(state.copyWith(status: value));
  }

  changeCheckBox() {
    emit(state.copyWith(agreeTermsCheckBox: !state.agreeTermsCheckBox));
  }

  changeShowPassword({required bool isRegister}) {
    if(isRegister) {
      emit(state.copyWith(showRegisterPassword: !state.showRegisterPassword));
    }else{
      emit(state.copyWith(showLoginPassword: !state.showLoginPassword));
    }
  }

  passwordText({String? value,required bool isRegister}) {
    if(isRegister) {
      emit(state.copyWith(registerPassword: value));
    }else{
      emit(state.copyWith(loginPassword: value));
    }
  }

  checkValidation() {
    bool isVal = formKey.currentState!.validate();
    if (!state.agreeTermsCheckBox) {
      emit(state.copyWith(isTermsAccepted: false));
      return;
    }
    emit(state.copyWith(isTermsAccepted: true));
    if (isVal) {
      print('Everthing is okay');
      return true;
    }
  }
}
