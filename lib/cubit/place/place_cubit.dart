import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel_app/core/constants.dart';
import 'package:travel_app/repositories/like_repository.dart';
import '../../models/place.dart';
import '../../repositories/comment_repository.dart';
import '../../repositories/place_repository.dart';
import '../../repositories/will_visit_repository.dart';

part 'place_state.dart';

class PlaceCubit extends Cubit<PlaceState> {
  final BasePlaceRepository _placeRepository;
  PlaceCubit({BasePlaceRepository? placeRepository})
      : _placeRepository = placeRepository ?? PlaceRepository(),
        super(PlaceState.initial());
  final BaseLikeRepository _likeRepository = LikeRepository();
  final BaseCommentRepository _commentRepository = CommentRepository();
  final BaseWillVisitRepository _willVisitRepository = WillVisitRepository();

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
          (b, a) => a.viewCount.compareTo(b.viewCount),
        );
        emit(state.copyWith(places: list, sortedValue: PlaceSorts.popular));
        break;
      case PlaceSorts.mostRated:
        var list = state.places;
        list.sort(
          (b, a) => a.rateAvgCount.compareTo(b.rateAvgCount),
        );
        print(list.first.rateAvgCount);
        emit(state.copyWith(places: list, sortedValue: PlaceSorts.mostRated));
        break;
      case PlaceSorts.newAdded:
        var list = state.places;
        list.sort(
          (b, a) => a.createdDate.compareTo(b.createdDate),
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

  getAllLikedPlaces() {
    emit(state.copyWith(status: PlaceStatus.loading));
    final likeResult = _likeRepository.getAllUserLikes();
    likeResult.listen((likeModelList) {}).onData((data) async {
      if (data.isNotEmpty) {
        final result = await _placeRepository.getAllUserFavoritePlaces(data);
        emit(state.copyWith(status: PlaceStatus.success, places: result));
      } else {
        emit(state.copyWith(status: PlaceStatus.success, places: []));
      }
    });
  }

  getAllRatedPlaces() {
    emit(state.copyWith(status: PlaceStatus.loading));
    final result = _commentRepository.getAllUserReviews();
    result.listen((comments) {}).onData((comments) async {
      if (comments.isNotEmpty) {
        final result = await _placeRepository.getAllUserReviewPlaces(comments);
        emit(state.copyWith(status: PlaceStatus.success, places: result));
      } else {
        emit(state.copyWith(status: PlaceStatus.success, places: []));
      }
    });
  }

  getAllWillVisitedPlaces() {
    emit(state.copyWith(status: PlaceStatus.loading));
    final result = _willVisitRepository.getAllUserWillVisits();
    result.listen((willVisits) {}).onData((willVisits) async {
      if (willVisits.isNotEmpty) {
        final result = await _placeRepository.getAllUserWillVisitPlace(willVisits);
        emit(state.copyWith(status: PlaceStatus.success, places: result));
      } else {
        emit(state.copyWith(status: PlaceStatus.success, places: []));
      }
    });
  }
}
