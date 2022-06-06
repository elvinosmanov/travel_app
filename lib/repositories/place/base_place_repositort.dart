import 'package:travel_app/models/place.dart';

abstract class BasePlaceRepository {
  // Stream<List<PlaceModel>> getAllPlaces();
  // Stream<List<PlaceModel>> getAllPlacesByCategory();
  Stream<List<PlaceModel>> getAllPlacesBySortValue(int sortValue);
}
