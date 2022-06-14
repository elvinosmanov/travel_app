import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/like.dart';
import '../../repositories/like_repository.dart';

part 'like_state.dart';

class LikeCubit extends Cubit<LikeState> {
  final BaseLikeRepository _likeRepository;
  LikeCubit({BaseLikeRepository? likeRepository})
      : _likeRepository = likeRepository ?? LikeRepository(),
        super(LikeState.initial());

  getAllUserLikes() {
    emit(state.copyWith(status: LikeStatus.loading));
    final result = _likeRepository.getAllUserLikes();
    result.listen((likeList) {})
      ..onData((likeList) {
        emit(state.copyWith(status: LikeStatus.success, likeList: likeList));
      })
      ..onError((e) {
        emit(state.copyWith(status: LikeStatus.error, error: 'Error: $e'));
      });
  }


  void likeOrNotPlaces(String placeId, bool isLiked) {
    _likeRepository.likeOrNotPlaces(placeId, isLiked);
    emit(state.copyWith(status: LikeStatus.success));
  }
}
