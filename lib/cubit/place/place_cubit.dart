import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel_app/core/constants.dart';

import '../../models/like.dart';
import '../../models/place.dart';
import '../../repositories/place_repository.dart';

part 'place_state.dart';

class PlaceCubit extends Cubit<PlaceState> {
  final BasePlaceRepository _placeRepository;
  PlaceCubit({BasePlaceRepository? placeRepository})
      : _placeRepository = placeRepository ?? PlaceRepository(),
        super(PlaceState.initial());
  getAllPlacesBy({String? categoryId}) async {
    // if (categoryId == state.categoryId) return;
    emit(state.copyWith(status: PlaceStatus.loading, categoryId: categoryId ?? state.categoryId));
    Stream<List<PlaceModel>> result;
    result = _placeRepository.getAllPlacesByCategoryId(categoryId ?? state.categoryId);
    result.listen((placeList) {})
      ..onData((placeList) {
        changePlaceSortValue(state.sortedValue);
        emit(state.copyWith(status: PlaceStatus.success, places: placeList));
      })
      ..onError((e) => emit(state.copyWith(status: PlaceStatus.error, error: 'Error: $e')));
  }

  changePlaceSortValue(PlaceSorts value) {
    switch (value) {
      case PlaceSorts.popular:
        var list = state.places;
        list.sort(
          (a, b) => a.viewCount.compareTo(b.viewCount),
        );
        emit(state.copyWith(places: list, sortedValue: PlaceSorts.popular));
        break;
      case PlaceSorts.mostRated:
        var list = state.places;
        list.sort(
          (a, b) => a.rateAvgCount.compareTo(b.rateAvgCount),
        );
        emit(state.copyWith(places: list, sortedValue: PlaceSorts.mostRated));
        break;
      case PlaceSorts.newAdded:
        var list = state.places;
        list.sort(
          (a, b) => a.createdDate.compareTo(b.createdDate),
        );
        emit(state.copyWith(places: list, sortedValue: PlaceSorts.newAdded));
        break;
      // default:
      //   emit(state.copyWith(places: state.places, sortedValue: state.sortedValue));
    }
  }

  void increamantViewCount(String placeId) {
    _placeRepository.increamentViewCount(placeId);
  }

  getPlaceById(String placeId) {
    emit(state.copyWith(status: PlaceStatus.loading));

    final result = _placeRepository.getPlaceById(placeId);
    result.listen((placeModel) {})
      ..onData((placeModel) {
        emit(state.copyWith(status: PlaceStatus.success, placeModel: placeModel));
      })
      ..onError((e) => emit(state.copyWith(status: PlaceStatus.error, error: 'Error: $e')));
  }

  getAllLikedPlaces(List<LikeModel> likeModelList) async {
    emit(state.copyWith(status: PlaceStatus.loading));

    final result = _placeRepository.getAllUserFavoritePlaces(likeModelList);
    result.listen((placeModel) {})
      ..onData((placeList) {
        print('placeList.length ${placeList.length}');
        print('emit etdi');
        emit(state.copyWith(status: PlaceStatus.success, places: placeList));
      })
      ..onError((e) => emit(state.copyWith(status: PlaceStatus.error, error: 'Error: $e')));
  }
}
