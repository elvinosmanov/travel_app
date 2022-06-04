import 'package:travel_app/models/category.dart';

abstract class BaseCategoryRepository {
  Future<List<CategoryModel?>> getAllCategories();
}
