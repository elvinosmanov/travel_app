import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_app/models/category.dart';
import 'package:travel_app/repositories/category/base_category_repository.dart';

class CategoryRepository extends BaseCategoryRepository {
  final _firebase = FirebaseFirestore.instance;
  @override
  Stream<List<CategoryModel?>> getAllCategories() {
    Stream<List<CategoryModel>> categortList;
    try {
      final querySnapshot = _firebase.collection('categories').snapshots();
      categortList = querySnapshot
          .map((querySnap) => querySnap.docs.map((snapshot) => CategoryModel.getFromSnapshot(snapshot)).toList());
      return categortList;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
