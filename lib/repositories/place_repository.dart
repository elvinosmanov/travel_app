import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_app/models/place.dart';

class PlaceRepository extends BasePlaceRepository {
  final _firebase = FirebaseFirestore.instance;

  @override
  Stream<List<PlaceModel>> getAllPlacesBy(int sortValue, String? categoryId) {
    Stream<List<PlaceModel>> placeList;
    Stream<QuerySnapshot> querySnapshot;
    Query<Map<String, dynamic>> query;
    if (categoryId != null) {
      query = _firebase.collection('places').where('categories', arrayContains: categoryId);
    } else {
      query = _firebase.collection('places');
    }
    try {
      switch (sortValue) {
        case 0:
          querySnapshot = query.snapshots();
          break;
        case 1:
          querySnapshot = query.limit(1).snapshots();
          break;
        case 2:
          querySnapshot = query.limit(2).snapshots();
          break;
        case 3:
          querySnapshot = query.limit(3).snapshots();
          break;
        case 4:
          querySnapshot = query.limit(4).snapshots();
          break;
        case 5:
          querySnapshot = query.limit(5).snapshots();
          break;
        default:
          querySnapshot = query.limit(6).snapshots();
      }
      placeList = querySnapshot
          .map((querySnap) => querySnap.docs.map((snapshot) => PlaceModel.getFromSnapshot(snapshot)).toList());
      return placeList;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  // addPlaces() {
  //   PlaceModel placeModel = PlaceModel(
  //       categories: const ['qlQQt96efCf6KTtasKAs', 'VNEfgzFC07kbC6rEK7sk'],
  //       title: 'Menim balam baldir',
  //       description: 'Balan Baldir yoxsa daldir',
  //       location: 'Qudani alim',
  //       imageURLs: const [
  //         'https://firebasestorage.googleapis.com/v0/b/azerbaijan-travel-app.appspot.com/o/trip_image.jpg?alt=media&token=a84dfc23-0802-4eb4-9d44-2425d40720ce',
  //         'https://firebasestorage.googleapis.com/v0/b/azerbaijan-travel-app.appspot.com/o/trip_image.jpg?alt=media&token=a84dfc23-0802-4eb4-9d44-2425d40720ce',
  //         'https://firebasestorage.googleapis.com/v0/b/azerbaijan-travel-app.appspot.com/o/trip_image.jpg?alt=media&token=a84dfc23-0802-4eb4-9d44-2425d40720ce'
  //       ],
  //       commentCount: 24,
  //       likeCount: 43,
  //       rateAvgCount: 4.6,
  //       viewCount: 13,
  //       createdDate: DateTime.now());
  //   _firebase.collection('places').doc().set(placeModel.toMap());
  // }
}

abstract class BasePlaceRepository {
  Stream<List<PlaceModel>> getAllPlacesBy(int sortValue, String? categoryId);
  // Stream<List<PlaceModel>> getAllPlacesByCategoryId(String id);
}
