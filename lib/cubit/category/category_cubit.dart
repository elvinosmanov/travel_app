import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel_app/models/category.dart';
import 'package:travel_app/repositories/category_repository.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final BaseCategoryRepository _categoryRepository;
  CategoryCubit({BaseCategoryRepository? categoryRepository})
      : _categoryRepository = categoryRepository ?? CategoryRepository(),
        super(CategoryState.initial());

  void getAllCategories() {
    emit(state.copyWith(status: CategortStatus.loading));
    try {
      final result = _categoryRepository.getAllCategories();
      result.listen(
        (categoryList) {
          emit(state.copyWith(status: CategortStatus.success, categoryList: categoryList));
        },
      );
    } catch (e) {
      emit(state.copyWith(status: CategortStatus.error, error: 'Error: $e'));
    }
  }
}
