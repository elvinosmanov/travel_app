part of 'place_cubit.dart';

enum PlaceStatus { initial, loading, success, error }

enum PlaceSorts {
  all('All'),
  popular('Popular'),
  recommended('Recommended'),
  mostRated('Most Rated'),
  newAdded('New Added');

  final String _value;
  const PlaceSorts(this._value);
  @override
  String toString() => _value;
}

class PlaceState extends Equatable {
  const PlaceState(
    this.status,
    this.places,
    this.placeModel,
    this.error,
    this.sortedValue,
    this.categoryId,
  );
  final PlaceStatus status;
  final List<PlaceModel> places;
  final PlaceModel placeModel;
  final String error;
  final PlaceSorts sortedValue;
  final String? categoryId;
  PlaceState.initial()
      : status = PlaceStatus.initial,
        error = '',
        sortedValue = PlaceSorts.all,
        categoryId = null,
        placeModel = PlaceModel.empty,
        places = [];
  //DONT FORGET TO ADD FIELD HERE
  @override
  List<Object> get props => [status, places];

  PlaceState copyWith({
    PlaceStatus? status,
    List<PlaceModel>? places,
    PlaceModel? placeModel,
    String? error,
    PlaceSorts? sortedValue,
    String? categoryId,
  }) {
    return PlaceState(
      status ?? this.status,
      places ?? this.places,
      placeModel ?? this.placeModel,
      error ?? this.error,
      sortedValue ?? this.sortedValue,
      categoryId ?? this.categoryId,
    );
  }
}
