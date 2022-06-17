import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class PlaceModel extends Equatable {
  final String id;
  final List<dynamic> categories;
  final String title;
  final String description;
  final String locationName;
  final List<String> imageURLs;
  final int commentCount;
  final int likeCount;
  final int viewCount;
  final double rateAvgCount;
  final DateTime createdDate;
  final GeoPoint location;
  const PlaceModel({
    required this.id,
    required this.categories,
    required this.title,
    required this.description,
    required this.locationName,
    required this.imageURLs,
    required this.commentCount,
    required this.likeCount,
    required this.viewCount,
    required this.rateAvgCount,
    required this.createdDate,
    required this.location,
  });
  static PlaceModel get empty => PlaceModel(
      id: '',
      categories: const [],
      title: '',
      description: '',
      locationName: '',
      location: const GeoPoint(0,0),
      imageURLs: const [],
      commentCount: 0,
      likeCount: 0,
      viewCount: 0,
      rateAvgCount: 0,
      createdDate: DateTime.now());

  factory PlaceModel.getFromSnapshot(DocumentSnapshot snapshot) {
    PlaceModel placeModel = PlaceModel(
        id: snapshot.id,
        categories: snapshot['categories'],
        title: snapshot['title'],
        
        description: snapshot['description'],
        locationName: snapshot['location_name'],
        location: snapshot['location'],
        imageURLs: List.from(snapshot['image_urls']),
        commentCount: snapshot['comment_count'],
        likeCount: snapshot['like_count'],
        rateAvgCount: snapshot['rate_avg_count'].toDouble(),
        viewCount: snapshot['view_count'],
        createdDate: DateTime.parse(snapshot['created_date'].toDate().toString()));
    return placeModel;
  }

  @override
  List<Object?> get props => [
        id,
        categories,
        title,
        description,
        locationName,
        imageURLs,
        commentCount,
        likeCount,
        rateAvgCount,
        viewCount,
        createdDate
      ];

  Map<String, dynamic> toMap() {
    return {
      'categories': categories,
      'title': title,
      'description': description,
      'location_name': locationName,
      'location': location,
      'image_urls': imageURLs,
      'comment_count': commentCount,
      'like_count': likeCount,
      'view_count': viewCount,
      'rate_avg_count': rateAvgCount,
      'created_date': Timestamp.fromDate(createdDate),
    };
  }

  @override
  String toString() {
    return 'PlaceModel(id: $id, categories: $categories, title: $title, description: $description, location: $locationName, imageURLs: $imageURLs, commentCount: $commentCount, likeCount: $likeCount, viewCount: $viewCount, rateAvgCount: $rateAvgCount,  createdDate: $createdDate)';
  }
}
