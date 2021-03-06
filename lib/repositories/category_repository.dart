import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_app/models/category.dart';

class CategoryRepository extends BaseCategoryRepository {
  final _firebase = FirebaseFirestore.instance;
  @override
  Stream<List<CategoryModel?>> getAllCategories() {
    Stream<List<CategoryModel>> categorytList;
      final querySnapshot = _firebase.collection('categories').snapshots();
      categorytList = querySnapshot
          .map((querySnap) => querySnap.docs.map((snapshot) => CategoryModel.getFromSnapshot(snapshot)).toList());
      return categorytList;
  }
}
abstract class BaseCategoryRepository {
  Stream<List<CategoryModel?>> getAllCategories();
}
