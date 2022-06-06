import 'package:travel_app/models/category.dart';

abstract class BaseCategoryRepository {
  Stream<List<CategoryModel?>> getAllCategories();
}
