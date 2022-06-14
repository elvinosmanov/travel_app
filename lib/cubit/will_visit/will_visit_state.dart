part of 'will_visit_cubit.dart';

enum WillVisitStatus { initial, loading, success, error }

class WillVisitState extends Equatable {
  const WillVisitState(
    this.status,
    this.willVisitList,
    this.error,
  );
  final WillVisitStatus status;
  final List<WillVisitModel> willVisitList;
  final String error;
  WillVisitState.initial()
      : status = WillVisitStatus.initial,
        error = '',
        willVisitList = [];

  @override
  List<Object> get props => [status, willVisitList, error];
  bool checkWillVisit(String placeId) {
    return willVisitList.any((element) => element.placeId == placeId);
  }

  WillVisitState copyWith({
    WillVisitStatus? status,
    List<WillVisitModel>? willVisitList,
    String? error,
  }) {
    return WillVisitState(
      status ?? this.status,
      willVisitList ?? this.willVisitList,
      error ?? this.error,
    );
  }
}
