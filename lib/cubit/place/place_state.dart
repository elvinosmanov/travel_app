part of 'place_cubit.dart';

enum PlaceStatus { initial, loading, success, error }

class PlaceState extends Equatable {
  const PlaceState(
    this.status,
    this.places,
    this.error,
    this.sortIndex,
  );
  final PlaceStatus status;
  final List<PlaceModel> places;
  final String error;
  final int sortIndex;
  PlaceState.initial()
      : status = PlaceStatus.initial,
        error = '',
        sortIndex = 0,
        places = [];
  //DONT FORGET TO ADD FIELD HERE
  @override
  List<Object> get props => [status, places];

  PlaceState copyWith({
    PlaceStatus? status,
    List<PlaceModel>? places,
    String? error,
    int? sortIndex,
  }) {
    return PlaceState(
      status ?? this.status,
      places ?? this.places,
      error ?? this.error,
      sortIndex ?? this.sortIndex,
    );
  }
}
