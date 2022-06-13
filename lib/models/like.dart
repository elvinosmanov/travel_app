import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class LikeModel extends Equatable {
  final String userId;
  final String placeId;
  const LikeModel({
    required this.userId,
    required this.placeId,
  });

  @override
  List<Object?> get props => [userId, placeId];

  @override
  String toString() => 'Like(userId: $userId, placeId: $placeId)';
  factory LikeModel.getFromSnapshot(DocumentSnapshot snap) {
    return LikeModel(userId: snap['user_id'], placeId: snap['place_id']);
  }
  Map<String, dynamic> toMap() {
    return {'user_id': userId, 'place_id': placeId};
  }
}
