import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_app/core/constants.dart';
import 'package:travel_app/models/like.dart';

class LikeRepository extends BaseLikeRepository {
  final CollectionReference _likedPlaceRef = FirebaseFirestore.instance.collection('likedplaces');
  //TODO authentication duzelenden sonra user idini deyis
  @override
  Stream<List<LikeModel>> getAllUserLikes() {
    var list = _likedPlaceRef.where('user_id', isEqualTo: kTemporaryUserId).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => LikeModel.getFromSnapshot(doc)).toList();
    });
    return list;
  }


  @override
  Future<void> likeOrNotPlaces(String placeId, bool isLiked) async {
    var dc = FirebaseFirestore.instance.collection('places').doc(placeId);
    if (isLiked) {
      await _likedPlaceRef.doc('${kTemporaryUserId}_$placeId').delete();
      dc.update({"like_count": FieldValue.increment(-1)});
    } else {
      LikeModel likeModel = LikeModel(userId: kTemporaryUserId, placeId: placeId);
      dc.update({"like_count": FieldValue.increment(1)});

      await _likedPlaceRef.doc('${kTemporaryUserId}_$placeId').set(likeModel.toMap());
    }
  }
}

abstract class BaseLikeRepository {
  Stream<List<LikeModel>> getAllUserLikes();
  Future<void> likeOrNotPlaces(String placeId, bool isLiked);
}
