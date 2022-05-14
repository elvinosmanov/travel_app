import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState.initial());
  void onItemTapped(int index) {
      emit(state.copyWith(selectedPageIndex: index));
  }
}
