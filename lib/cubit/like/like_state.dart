part of 'like_cubit.dart';

enum LikeStatus { initial, loading, success, error }

class LikeState extends Equatable {
  const LikeState(
    this.status,
    this.likeList,
    this.error,
  );
  final LikeStatus status;
  final List<LikeModel> likeList;
  final String error;
  LikeState.initial()
      : status = LikeStatus.initial,
        error = '',
        likeList = [];

  @override
  List<Object> get props => [status, likeList, error];
  bool checkLike(String placeId) {
    return likeList.any((element) => element.placeId == placeId);
  }

  LikeState copyWith({
    LikeStatus? status,
    List<LikeModel>? likeList,
    String? error,
    int? likeCount,
  }) {
    return LikeState(
      status ?? this.status,
      likeList ?? this.likeList,
      error ?? this.error,
    );
  }
}
