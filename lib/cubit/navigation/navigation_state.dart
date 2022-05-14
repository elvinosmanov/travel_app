part of 'navigation_cubit.dart';

class NavigationState extends Equatable {
  const NavigationState(
    this.selectedPageIndex,
  );
  const NavigationState.initial() : selectedPageIndex = 0;
  final int selectedPageIndex;
  @override
  List<Object> get props => [selectedPageIndex];

  NavigationState copyWith({
    int? selectedPageIndex,
  }) {
    return NavigationState(
      selectedPageIndex ?? this.selectedPageIndex,
    );
  }
}
