import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class WillVisitModel extends Equatable {
  final String userId;
  final String placeId;
  const WillVisitModel({
    required this.userId,
    required this.placeId,
  });

  @override
  List<Object?> get props => [userId, placeId];

  
  factory WillVisitModel.getFromSnapshot(DocumentSnapshot snap) {
    return WillVisitModel(userId: snap['user_id'], placeId: snap['place_id']);
  }
  Map<String, dynamic> toMap() {
    return {'user_id': userId, 'place_id': placeId};
  }

  @override
  String toString() => 'WillVisitModel(userId: $userId, placeId: $placeId)';
}
