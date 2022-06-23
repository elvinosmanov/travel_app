import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String username;
  final String email;
  final String fullName;
  final String coverImageUrl;
  final String profileImageUrl;
  final DateTime createdTime;
  const UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.fullName,
    required this.coverImageUrl,
    required this.profileImageUrl,
    required this.createdTime,
  });

  static UserModel get empty => UserModel(
      id: '',
      username: '',
      email: '',
      fullName: '',
      coverImageUrl:
          'https://firebasestorage.googleapis.com/v0/b/azerbaijan-travel-app.appspot.com/o/flag_interest_image.jpg?alt=media&token=980696c3-24d2-49b3-a016-11ef138dbf99',
      profileImageUrl:
          'https://firebasestorage.googleapis.com/v0/b/azerbaijan-travel-app.appspot.com/o/flag_interest_image.jpg?alt=media&token=980696c3-24d2-49b3-a016-11ef138dbf99',
      createdTime: DateTime.now());

  @override
  List<Object?> get props => [id, username, email, fullName, coverImageUrl, profileImageUrl, createdTime];

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'fullName': fullName,
      'coverImageUrl': coverImageUrl,
      'profileImageUrl': profileImageUrl,
      'createdTime': createdTime.millisecondsSinceEpoch,
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot snap) {
    return UserModel(
      id: snap['id'] ?? '',
      username: snap['username'] ?? '',
      email: snap['email'] ?? '',
      fullName: snap['fullName'] ?? '',
      coverImageUrl: snap['coverImageUrl'] ?? '',
      profileImageUrl: snap['profileImageUrl'] ?? '',
      createdTime: DateTime.parse(snap['created_date'].toDate().toString()),
    );
  }
}
