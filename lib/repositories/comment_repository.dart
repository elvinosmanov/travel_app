import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_app/models/comment.dart';

class CommentRepository extends BaseCommentRepository {
  final _firebase = FirebaseFirestore.instance;

  @override
  Stream<List<CommentModel>> getAllCommentsByPlaceId(String placeId,[int? limit]) {
    Stream<List<CommentModel>> commentList;
      final querySnapshot = _firebase.collection('reviews').where('place_id', isEqualTo: placeId).limit(limit??100).snapshots();
      commentList = querySnapshot.map((querySnap) => querySnap.docs.map((snapshot) {
            return CommentModel.getFromSnapshot(snapshot);
          }).toList());
      return commentList;
  }
}

abstract class BaseCommentRepository {
  Stream<List<CommentModel>> getAllCommentsByPlaceId(String placeId,[int? limit]);

  sendReview(CommentModel commentModel) {}
}
