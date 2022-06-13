import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_app/core/constants.dart';

import '../models/will_visit.dart';

class WillVisitRepository extends BaseWillVisitRepository {
  final CollectionReference _willVisitPlaceRef = FirebaseFirestore.instance.collection('willvisitplaces');
  //TODO authentication duzelenden sonra user idini deyis
  @override
  Stream<List<WillVisitModel>> getAllUserWillVisits() {
    var list = _willVisitPlaceRef
        // .where('user_id', isEqualTo: kTemporaryUserId)
        .snapshots()
        .map((snapshot) {
      print('document size: ${snapshot.size}');
      return snapshot.docs.map((doc) => WillVisitModel.getFromSnapshot(doc)).toList();
    });
    print(list.toString());
    return list;
  }

  @override
  Future<void> willVisitOrNotPlaces(String placeId, bool iswillVisit) async {
    if (iswillVisit) {
      await _willVisitPlaceRef.doc('${kTemporaryUserId}_$placeId').delete();
    } else {
      WillVisitModel willVisitModel = WillVisitModel(userId: kTemporaryUserId, placeId: placeId);
      await _willVisitPlaceRef.doc('${kTemporaryUserId}_$placeId').set(willVisitModel.toMap());
    }
  }

}

abstract class BaseWillVisitRepository {
  Stream<List<WillVisitModel>> getAllUserWillVisits();
  Future<void> willVisitOrNotPlaces(String placeId, bool iswillVisit);
}
