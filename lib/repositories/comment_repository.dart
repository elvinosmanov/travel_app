import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_app/models/comment.dart';

class CommentRepository extends BaseCommentRepository {
  final _commentRef = FirebaseFirestore.instance.collection('reviews');

  @override
  Stream<List<CommentModel>> getAllCommentsByPlaceId(String placeId, [int? limit]) {
    var list = _commentRef.where('place_id', isEqualTo: placeId).limit(limit ?? 100).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return CommentModel.getFromSnapshot(doc);
      }).toList();
    });
    return list;
  }

  @override
  Stream<List<CommentModel>> getAllUserReviews(String userId) {
    var list = _commentRef.where('user_id', isEqualTo: userId).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => CommentModel.getFromSnapshot(doc)).toList();
    });
    return list;
  }

  @override
  Future<void> sendReview(CommentModel commentModel) async {
    await _commentRef.doc('${commentModel.userId}_${commentModel.placeId}').set(commentModel.toMap());
  }
}

abstract class BaseCommentRepository {
  Stream<List<CommentModel>> getAllCommentsByPlaceId(String placeId, [int? limit]);
  Stream<List<CommentModel>> getAllUserReviews(String userId);
  Future<void> sendReview(CommentModel commentModel);
}
