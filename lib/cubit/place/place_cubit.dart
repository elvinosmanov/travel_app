import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/place.dart';
import '../../repositories/place/base_place_repositort.dart';
import '../../repositories/place/place_repository.dart';

part 'place_state.dart';

class PlaceCubit extends Cubit<PlaceState> {
  final BasePlaceRepository _placeRepository;
  PlaceCubit({BasePlaceRepository? placeRepository})
      : _placeRepository = placeRepository ?? PlaceRepository(),
        super(PlaceState.initial());

  getAllPlacesBySortValue(int value) {
    emit(state.copyWith(status: PlaceStatus.loading, sortIndex: value));
    try {
      final result = _placeRepository.getAllPlacesBySortValue(value);
      result.listen(
        (placeList) {
          emit(state.copyWith(status: PlaceStatus.success, places: placeList));
        },
      );
    } catch (e) {
      emit(state.copyWith(status: PlaceStatus.error, error: 'Error: $e'));
    }
  }

  getAllPlacesByCategoryId(String id) {
    emit(state.copyWith(status: PlaceStatus.loading));
    try {
      final result = _placeRepository.getAllPlacesByCategoryId(id);
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
