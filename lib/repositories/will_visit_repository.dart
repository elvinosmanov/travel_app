import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/will_visit.dart';

class WillVisitRepository extends BaseWillVisitRepository {
  final CollectionReference _willVisitPlaceRef = FirebaseFirestore.instance.collection('willvisitplaces');
  @override
  Stream<List<WillVisitModel>> getAllUserWillVisits(String userId) {
    var list = _willVisitPlaceRef.where('user_id', isEqualTo: userId).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return WillVisitModel.getFromSnapshot(doc);
      }).toList();
    });
    return list;
  }

  @override
  Future<void> willVisitOrNotPlaces(String placeId, bool iswillVisit, String userId) async {
    var dc = FirebaseFirestore.instance.collection('places').doc(placeId);
    if (iswillVisit) {
      await _willVisitPlaceRef.doc('${userId}_$placeId').delete();
      dc.update({"willvisit_count": FieldValue.increment(-1)});
    } else {
      WillVisitModel willVisitModel = WillVisitModel(userId: userId, placeId: placeId);
      await _willVisitPlaceRef.doc('${userId}_$placeId').set(willVisitModel.toMap());
      dc.update({"willvisit_count": FieldValue.increment(1)});
    }
  }
}

abstract class BaseWillVisitRepository {
  Stream<List<WillVisitModel>> getAllUserWillVisits( String userId);
  Future<void> willVisitOrNotPlaces(String placeId, bool iswillVisit, String userId);
}
