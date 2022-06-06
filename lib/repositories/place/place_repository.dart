import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_app/models/place.dart';
import 'package:travel_app/repositories/place/base_place_repositort.dart';

class PlaceRepository extends BasePlaceRepository {
  final _firebase = FirebaseFirestore.instance;

  @override
  Stream<List<PlaceModel>> getAllPlacesBySortValue(int sortValue) {
    Stream<List<PlaceModel>> placeList;
    try {
      final querySnapshot = _firebase.collection('places').snapshots();
      placeList = querySnapshot
          .map((querySnap) => querySnap.docs.map((snapshot) => PlaceModel.getFromSnapshot(snapshot)).toList());
      return placeList;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
  
}
