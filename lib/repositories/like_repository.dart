import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_app/core/constants.dart';
import 'package:travel_app/models/like.dart';

class LikeRepository extends BaseLikeRepository {
  final CollectionReference _likedPlaceRef = FirebaseFirestore.instance.collection('likedplaces');
  //TODO authentication duzelenden sonra user idini deyis
  @override
  Stream<List<LikeModel>> getAllUserLikes() {
    var list = _likedPlaceRef
        // .where('user_id', isEqualTo: kTemporaryUserId)
        .snapshots()
        .map((snapshot) {
      print('document size: ${snapshot.size}');
      return snapshot.docs.map((doc) => LikeModel.getFromSnapshot(doc)).toList();
    });
    print(list.toString());
    return list;
  }

  @override
  Future<void> likeOrNotPlaces(String placeId, bool isLiked) async {
    if (isLiked) {
      await _likedPlaceRef.doc('${kTemporaryUserId}_$placeId').delete();
    } else {
      LikeModel likeModel = LikeModel(userId: kTemporaryUserId, placeId: placeId);
      await _likedPlaceRef.doc('${kTemporaryUserId}_$placeId').set(likeModel.toMap());
    }
  }

}

abstract class BaseLikeRepository {
  Stream<List<LikeModel>> getAllUserLikes();
  Future<void> likeOrNotPlaces(String placeId, bool isLiked);
}
