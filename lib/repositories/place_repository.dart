import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_app/cubit/place/place_cubit.dart';
import 'package:travel_app/models/place.dart';

class PlaceRepository extends BasePlaceRepository {
  final _firebase = FirebaseFirestore.instance;

  @override
  Stream<List<PlaceModel>> getAllPlacesBy(PlaceSorts sortValue, String? categoryId) {
    Stream<List<PlaceModel>> placeList;
    Stream<QuerySnapshot> querySnapshot;
    Query<Map<String, dynamic>> query;
    if (categoryId != null && categoryId != 'all-categories-id') {
      query = _firebase.collection('places').where('categories', arrayContains: categoryId);
    } else {
      query = _firebase.collection('places');
    }
    try {
      switch (sortValue) {
        case PlaceSorts.all:
          querySnapshot = query.snapshots();
          break;
        case PlaceSorts.popular:
          querySnapshot = query.orderBy('view_count', descending: true).snapshots();
          break;
        case PlaceSorts.newAdded:
          querySnapshot = query.orderBy('created_date', descending: true).snapshots();
          break;
        case PlaceSorts.mostRated:
          querySnapshot = query.orderBy('rate_avg_count', descending: true).snapshots();
          break;

        case PlaceSorts.recommended:
          querySnapshot = query.limit(5).snapshots();
          break;
      }
      placeList = querySnapshot
          .map((querySnap) => querySnap.docs.map((snapshot) => PlaceModel.getFromSnapshot(snapshot)).toList());
      return placeList;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  addPlaces() {
    final docRef = _firebase.collection('places').doc();
    PlaceModel placeModel = PlaceModel(
        id: docRef.id,
        categories: const ['VNEfgzFC07kbC6rEK7sk'],
        title: 'Bu yenidir',
        description: 'Balan Baldir yoxsa daldir',
        location: 'YENI PLACE ',
        imageURLs: const [
          'https://firebasestorage.googleapis.com/v0/b/azerbaijan-travel-app.appspot.com/o/trip_image.jpg?alt=media&token=a84dfc23-0802-4eb4-9d44-2425d40720ce',
          'https://firebasestorage.googleapis.com/v0/b/azerbaijan-travel-app.appspot.com/o/trip_image.jpg?alt=media&token=a84dfc23-0802-4eb4-9d44-2425d40720ce',
        ],
        commentCount: 32,
        likeCount: 4568,
        rateAvgCount: 2.7,
        viewCount: 132164232,
        createdDate: DateTime.now());
    docRef.set(placeModel.toMap());
  }
}

abstract class BasePlaceRepository {
  Stream<List<PlaceModel>> getAllPlacesBy(PlaceSorts sortValue, String? categoryId);
  // Stream<List<PlaceModel>> getAllPlacesByCategoryId(String id);
}
