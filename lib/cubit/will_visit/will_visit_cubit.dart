import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/will_visit.dart';
import '../../repositories/will_visit_repository.dart';

part 'will_visit_state.dart';

class WillVisitCubit extends Cubit<WillVisitState> {
  final BaseWillVisitRepository _willVisitRepository;
  WillVisitCubit({BaseWillVisitRepository? willVisitRepository})
      : _willVisitRepository = willVisitRepository ?? WillVisitRepository(),
        super(WillVisitState.initial());

  getAllUserWillVisits(String userId) {
    emit(state.copyWith(status: WillVisitStatus.loading));
    final result = _willVisitRepository.getAllUserWillVisits(userId);
    result.listen((willVisitList) {})
      ..onData((willVisitList) {
        emit(state.copyWith(status: WillVisitStatus.success, willVisitList: willVisitList));
      })
      ..onError((e) {
        emit(state.copyWith(status: WillVisitStatus.error, error: 'Error: $e'));
      });
  }

  void willVisitOrNotPlaces(String placeId, bool isWillVisited, String userId) {
    _willVisitRepository.willVisitOrNotPlaces(placeId, isWillVisited, userId);
    emit(state.copyWith(status: WillVisitStatus.success));
  }
}
