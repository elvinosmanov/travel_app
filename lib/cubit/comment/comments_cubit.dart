import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel_app/core/constants.dart';
import 'package:travel_app/models/comment.dart';
import 'package:travel_app/repositories/comment_repository.dart';

part 'comments_state.dart';

class CommentCubit extends Cubit<CommentState> {
  final BaseCommentRepository _commentRepository;
  CommentCubit({BaseCommentRepository? commentRepository})
      : _commentRepository = commentRepository ?? CommentRepository(),
        super(CommentState.initial());

  getAllCommentsByPlaceId(String placeId, {int? limit}) {
    emit(state.copyWith(status: CommentStatus.loading));
    final result = _commentRepository.getAllCommentsByPlaceId(placeId, limit);
    result.listen((commentList) {})
      ..onData((commentList) {
        emit(state.copyWith(status: CommentStatus.success, comments: commentList));
      })
      ..onError((e) {
        emit(state.copyWith(status: CommentStatus.error, error: 'Error: $e'));
      });
  }

  void sendReview(String placeId, String review, double givenRate) {
    emit(state.copyWith(status: CommentStatus.loading));
    final CommentModel commentModel = CommentModel(
        userId: kTemporaryUserId,
        placeId: placeId,
        imageUrl: '',
        comment: review,
        submittedBy: '',
        rate: givenRate,
        createdDate: DateTime.now());
    final result = _commentRepository.sendReview(commentModel);
    result.listen((commentList) {})
      ..onData((commentList) {
        emit(state.copyWith(status: CommentStatus.success, comments: commentList));
      })
      ..onError((e) {
        emit(state.copyWith(status: CommentStatus.error, error: 'Error: $e'));
      });
  }
}
