part of 'category_cubit.dart';

enum CategortStatus { initial, loading, success, error }

class CategoryState extends Equatable {
  CategoryState(
    this.status,
    this.categoryList,
    this.error,
  );
  final CategortStatus status;
  final List<CategoryModel?> categoryList;
  final String? error;

  CategoryState.initial()
      : status = CategortStatus.initial,
        error = null,
        categoryList = [];

  @override
  List<Object> get props => [categoryList, status];

  CategoryState copyWith({
    CategortStatus? status,
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
