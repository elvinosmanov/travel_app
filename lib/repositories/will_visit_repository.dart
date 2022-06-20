import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_app/core/constants.dart';

import '../models/will_visit.dart';

class WillVisitRepository extends BaseWillVisitRepository {
  final CollectionReference _willVisitPlaceRef = FirebaseFirestore.instance.collection('willvisitplaces');
  //TODO authentication duzelenden sonra user idini deyis
  @override
  Stream<List<WillVisitModel>> getAllUserWillVisits() {
    var list = _willVisitPlaceRef.where('user_id', isEqualTo: kTemporaryUserId).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return WillVisitModel.getFromSnapshot(doc);
      }).toList();
    });
    return list;
  }

  @override
  Future<void> willVisitOrNotPlaces(String placeId, bool iswillVisit) async {
    var dc = FirebaseFirestore.instance.collection('places').doc(placeId);
    if (iswillVisit) {
      await _willVisitPlaceRef.doc('${kTemporaryUserId}_$placeId').delete();
      dc.update({"willvisit_count": FieldValue.increment(-1)});
    } else {
      WillVisitModel willVisitModel = WillVisitModel(userId: kTemporaryUserId, placeId: placeId);
      await _willVisitPlaceRef.doc('${kTemporaryUserId}_$placeId').set(willVisitModel.toMap());
      dc.update({"willvisit_count": FieldValue.increment(1)});
    }
  }
}

abstract class BaseWillVisitRepository {
  Stream<List<WillVisitModel>> getAllUserWillVisits();
  Future<void> willVisitOrNotPlaces(String placeId, bool iswillVisit);
}