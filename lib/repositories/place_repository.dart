import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_app/cubit/place/place_cubit.dart';
import 'package:travel_app/models/place.dart';

class PlaceRepository extends BasePlaceRepository {
  // final _firebase = FirebaseFirestore.instance;
  final _placeRef = FirebaseFirestore.instance.collection('places');
  @override
  Stream<List<PlaceModel>> getAllPlacesByCategoryId(String? categoryId) {
    Stream<List<PlaceModel>> placeList;
    Query<Map<String, dynamic>> query;
    if (categoryId != null && categoryId != 'all-categories-id') {
      query = _placeRef.where('categories', arrayContains: categoryId);
    } else {
      query = _placeRef;
    }

    placeList = query
        .orderBy('view_count', descending: true)
        .snapshots()
        .map((querySnap) => querySnap.docs.map((snapshot) => PlaceModel.getFromSnapshot(snapshot)).toList());
    return placeList;
  }
  @override
  Stream<List<PlaceModel>> getAllUserFavoritePlaces(String? userId) {
    Stream<List<PlaceModel>> placeList;
    Query<Map<String, dynamic>> query;
      query = _placeRef.where('categories', arrayContains: categoryId);
    placeList = query
        .orderBy('view_count', descending: true)
        .snapshots()
        .map((querySnap) => querySnap.docs.map((snapshot) => PlaceModel.getFromSnapshot(snapshot)).toList());
    return placeList;
  }

  @override
  void increamentViewCount(String placeId) {
    var dc = _placeRef.doc(placeId);
    dc.update({'view_count': FieldValue.increment(1)});
  }

  @override
  Future<void> updateReviewCountAndRate(String placeId, double rateValue) async {
    var doc = await _placeRef.doc(placeId).get();

    var placeModel = PlaceModel.getFromSnapshot(doc);
    var dc = _placeRef.doc(placeId);
    print(placeModel.rateAvgCount);
    print(placeModel.commentCount);
    print(placeModel.rateAvgCount * placeModel.commentCount + rateValue);
    dc.update({
      'comment_count': FieldValue.increment(1),
      'rate_avg_count': (placeModel.rateAvgCount * placeModel.commentCount + rateValue) / (placeModel.commentCount + 1)
    });
  }

  Future<bool> checkIfDocExists(String docId, String collectionName) async {
    try {
      // Get reference to Firestore collection
      var collectionRef = FirebaseFirestore.instance.collection(collectionName);

      var doc = await collectionRef.doc(docId).get();
      return doc.exists;
    } catch (e) {
      rethrow;
    }
  }

  addPlaces() {
    final docRef = _placeRef.doc();
    PlaceModel placeModel = PlaceModel(
      id: docRef.id,
      categories: const ['VNEfgzFC07kbC6rEK7sk'],
      title: 'Bu yenidir',
      description: 'Balan Baldir yoxsa daldir',
      locationName: 'YENI PLACE ',
      location: const GeoPoint(40, 40),
      imageURLs: const [
        'https://firebasestorage.googleapis.com/v0/b/azerbaijan-travel-app.appspot.com/o/trip_image.jpg?alt=media&token=a84dfc23-0802-4eb4-9d44-2425d40720ce',
        'https://firebasestorage.googleapis.com/v0/b/azerbaijan-travel-app.appspot.com/o/trip_image.jpg?alt=media&token=a84dfc23-0802-4eb4-9d44-2425d40720ce',
      ],
      commentCount: 32,
      likeCount: 4568,
      rateAvgCount: 2.7,
      viewCount: 132164232,
      createdDate: DateTime.now(),
    );
    docRef.set(placeModel.toMap());
  }

  @override
  Stream<PlaceModel> getPlaceById(String placeId) {
    return _placeRef.doc(placeId).snapshots().map((event) => PlaceModel.getFromSnapshot(event));
  }
}

abstract class BasePlaceRepository {
  Stream<List<PlaceModel>> getAllPlacesByCategoryId(String? categoryId);
  void increamentViewCount(String placeId);
  Future<void> updateReviewCountAndRate(String placeId, double rateValue);

  Stream<PlaceModel> getPlaceById(String placeId);
}
