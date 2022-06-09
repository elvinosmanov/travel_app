import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class PlaceModel extends Equatable {
  final List<dynamic> categories;
  final String title;
  final String description;
  final String location;
  final List<dynamic> imageURLs;
  final int commentCount;
  final int likeCount;
  final int viewCount;
  final double rateAvgCount;
  final DateTime createdDate;
  const PlaceModel({
    required this.categories,
    required this.title,
    required this.description,
    required this.location,
    required this.imageURLs,
    required this.commentCount,
    required this.likeCount,
    required this.rateAvgCount,
    required this.viewCount,
    required this.createdDate,
  });

  factory PlaceModel.getFromSnapshot(DocumentSnapshot snapshot) {
    PlaceModel placeModel = PlaceModel(
        categories: snapshot['categories'],
        title: snapshot['title'],
        description: snapshot['description'],
        location: snapshot['location'],
        imageURLs: snapshot['image_urls'],
        commentCount: snapshot['comment_count'],
        likeCount: snapshot['like_count'],
        rateAvgCount: snapshot['rate_avg_count'].toDouble(),
        viewCount: snapshot['view_count'],
        createdDate: DateTime.parse(snapshot['created_date'].toDate().toString()));
    return placeModel;
  }

  @override
  List<Object?> get props => [
        categories,
        title,
        description,
        location,
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
      'location': location,
      'image_urls': imageURLs,
      'comment_count': commentCount,
      'like_count': likeCount,
      'view_count': viewCount,
      'rate_avg_count': rateAvgCount,
      'created_date': Timestamp.fromDate(createdDate),
    };
  }
}
