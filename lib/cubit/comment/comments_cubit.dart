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
    result.listen((commentList) {
    })
      ..onData((commentList) {

        emit(state.copyWith(status: CommentStatus.success, comments: commentList));
      })
      ..onError((e) {
        print('error var $e');
        emit(state.copyWith(status: CommentStatus.error, error: 'Error: $e'));
      });
  }

  Future<void> sendReview(String placeId, String review, double givenRate) async {
    if (state.status == CommentStatus.loading) return;
    emit(state.copyWith(status: CommentStatus.loading));
    final CommentModel commentModel = CommentModel(
        userId: kTemporaryUserId,
        placeId: placeId,
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/azerbaijan-travel-app.appspot.com/o/flag_interest_image.jpg?alt=media&token=980696c3-24d2-49b3-a016-11ef138dbf99',
        comment: review,
        submittedBy: 'Name Surname',
        rate: givenRate,
        createdDate: DateTime.now());
    try {
      await _commentRepository.sendReview(commentModel);
      emit(state.copyWith(status: CommentStatus.success));
    } on Exception catch (e) {
      emit(state.copyWith(status: CommentStatus.error, error: 'Error: $e'));
    }
  }
}
