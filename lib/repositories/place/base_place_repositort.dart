import 'package:travel_app/models/place.dart';

abstract class BasePlaceRepository {
  Stream<List<PlaceModel>> getAllPlacesBySortValue(int sortValue);
  Stream<List<PlaceModel>> getAllPlacesByCategoryId(String id);
}
