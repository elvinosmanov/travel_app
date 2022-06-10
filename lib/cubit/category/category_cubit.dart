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
    emit(state.copyWith(status: CategoryStatus.loading));
    try {
      final result = _categoryRepository.getAllCategories();
      result.listen(
        (categoryList) {
          emit(state.copyWith(status: CategoryStatus.success, categoryList: [
            const CategoryModel(
                id: 'all-categories-id',
                name: 'All Categories',
                imageURL:
                    'https://firebasestorage.googleapis.com/v0/b/azerbaijan-travel-app.appspot.com/o/flag_interest_image.jpg?alt=media&token=980696c3-24d2-49b3-a016-11ef138dbf99'),
            ...categoryList
          ]));
        },
      );
    } catch (e) {
      emit(state.copyWith(status: CategoryStatus.error, error: 'Error: $e'));
    }
  }
}
