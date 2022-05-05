import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'welcome_state.dart';

class WelcomeCubit extends Cubit<WelcomeState> {
  WelcomeCubit() : super(const WelcomeState.inittial());
  changeStatus(WelcomeStatus value){
    emit(state.copyWith(status: value));
  }
}
