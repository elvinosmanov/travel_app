import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/place.dart';
import '../../repositories/place_repository.dart';

part 'place_state.dart';

class PlaceCubit extends Cubit<PlaceState> {
  final BasePlaceRepository _placeRepository;
  PlaceCubit({BasePlaceRepository? placeRepository})
      : _placeRepository = placeRepository ?? PlaceRepository(),
        super(PlaceState.initial());
  getAllPlacesBy(PlaceSorts value, {String? categoryId}) {
    emit(state.copyWith(status: PlaceStatus.loading, sortedValue: value, categoryId: categoryId ?? state.categoryId));
    try {
      final result = _placeRepository.getAllPlacesBy(value, categoryId ?? state.categoryId);
      result.listen(
        (placeList) {
          emit(state.copyWith(status: PlaceStatus.success, places: placeList));
        },
      );
    } catch (e) {
      emit(state.copyWith(status: PlaceStatus.error, error: 'Error: $e'));
    }
  }
}
