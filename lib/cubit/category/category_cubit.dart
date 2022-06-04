import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel_app/models/category.dart';
import 'package:travel_app/repositories/category/base_category_repository.dart';
import 'package:travel_app/repositories/category/category_repository.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final BaseCategoryRepository _categoryRepository;
  CategoryCubit({BaseCategoryRepository? categoryRepository})
      : _categoryRepository = categoryRepository ?? CategoryRepository(),
        super(CategoryState.initial());

  void getAllCategories() async {
    List<CategoryModel?> result = [];
    emit(state.copyWith(status: CategortStatus.loading));
    try {
      result = await _categoryRepository.getAllCategories();
      emit(state.copyWith(status: CategortStatus.success, categoryList: result));
    } catch (e) {
      emit(state.copyWith(status: CategortStatus.error, error: 'Error: $e'));
    }
  }
}
