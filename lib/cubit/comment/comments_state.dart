part of 'comments_cubit.dart';

enum CommentStatus { initial, loading, success, error }

class CommentState extends Equatable {
  const CommentState(
    this.status,
    this.comments,
    this.error,
  );
  final CommentStatus status;
  final List<CommentModel> comments;
  final String error;
  CommentState.initial()
      : status = CommentStatus.initial,
        error = '',
        comments = [];

  @override
  List<Object> get props => [status, comments, error];

  CommentState copyWith({
    CommentStatus? status,
    List<CommentModel>? comments,
    String? error,
  }) {
    return CommentState(
      status ?? this.status,
      comments ?? this.comments,
      error ?? this.error,
    );
  }
}
