import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class CommentModel extends Equatable {
  final String userId;
  final String placeId;
  final String imageUrl;
  final String comment;
  final String submittedBy;
  final double rate;
  final DateTime createdDate;
  const CommentModel({
    required this.userId,
    required this.placeId,
    required this.imageUrl,
    required this.comment,
    required this.submittedBy,
    required this.rate,
    required this.createdDate,
  });

  @override
  List<Object> get props {
    return [
      userId,
      placeId,
      imageUrl,
      comment,
      submittedBy,
      rate,
      createdDate,
    ];
  }

  factory CommentModel.getFromSnapshot(DocumentSnapshot snap) {
    CommentModel commentModel = CommentModel(
        userId: snap['user_id'],
        placeId: snap['place_id'],
        imageUrl: snap['image_url'],
        comment: snap['review'],
        submittedBy: snap['submitted_by'],
        rate: snap['rate'].toDouble(),
        createdDate: snap['created_date'].toDate());
    return commentModel;
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'place_id': placeId,
      'review': comment,
      'submitted_by': submittedBy,
      'rate': rate,
      'created_date': Timestamp.fromDate(createdDate),
    };
  }
}
