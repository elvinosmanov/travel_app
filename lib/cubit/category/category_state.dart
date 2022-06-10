part of 'category_cubit.dart';

enum CategoryStatus { initial, loading, success, error }

class CategoryState extends Equatable {
  const CategoryState(
    this.status,
    this.categoryList,
    this.error,
  );
  final CategoryStatus status;
  final List<CategoryModel?> categoryList;
  final String? error;

  CategoryState.initial()
      : status = CategoryStatus.initial,
        error = null,
        categoryList = [];

  @override
  List<Object> get props => [categoryList, status];

  CategoryState copyWith({
    CategoryStatus? status,
    List<CategoryModel?>? categoryList,
    String? error,
  }) {
    return CategoryState(
      status ?? this.status,
      categoryList ?? this.categoryList,
      error ?? this.error,
    );
  }
}
