import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_app/core/constants.dart';
import 'package:travel_app/models/place.dart';
import 'package:travel_app/repositories/place/base_place_repositort.dart';

class PlaceRepository extends BasePlaceRepository {
  final _firebase = FirebaseFirestore.instance;

  @override
  Stream<List<PlaceModel>> getAllPlacesBySortValue(int sortValue) {
    Stream<List<PlaceModel>> placeList;
    Stream<QuerySnapshot> querySnapshot;
    try {
      switch (placeSorts[sortValue]) {
        case "All":
          querySnapshot = _firebase.collection('places').snapshots();
          break;
        default:
          querySnapshot = _firebase.collection('places').limit(1).snapshots();
      }
      placeList = querySnapshot
          .map((querySnap) => querySnap.docs.map((snapshot) => PlaceModel.getFromSnapshot(snapshot)).toList());
      return placeList;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
