import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? id;
  final String username;
  final String email;
  final String fullName;
  final String locationName;
  final String coverImageUrl;
  final String profileImageUrl;
  final DateTime? createdTime;
  const UserModel({
    this.id,
    this.username = '',
    this.email = '',
    this.fullName = '',
    this.coverImageUrl =
        '',
    this.profileImageUrl = '',
    this.locationName = 'Baku, Azerbaijan',
    this.createdTime,
  });

  @override
  List<Object?> get props => [id, username, email, fullName, coverImageUrl, profileImageUrl, createdTime];

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'full_name': fullName,
      'location_name': locationName,
      'cover_image_url': coverImageUrl,
      'profile_image_url': profileImageUrl,
      'created_time': Timestamp.fromDate(createdTime ?? DateTime.now()),
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot snap) {
    return UserModel(
      id: snap.id,
      username: snap['username'] ?? '',
      email: snap['email'] ?? '',
      fullName: snap['full_name'] ?? '',
      coverImageUrl: snap['cover_image_url'] ?? '',
      profileImageUrl: snap['profile_image_url'] ?? '',
      createdTime: DateTime.parse(snap['created_time'].toDate().toString()),
      locationName: snap['location_name'] ?? '',
    );
  }

  @override
  String toString() {
    return 'UserModel(id: $id, username: $username, email: $email, fullName: $fullName, coverImageUrl: $coverImageUrl, profileImageUrl: $profileImageUrl, createdTime: $createdTime)';
  }

  UserModel copyWith({
    String? id,
    String? username,
    String? email,
    String? fullName,
    String? locationName,
    String? coverImageUrl,
    String? profileImageUrl,
    DateTime? createdTime,
  }) {
    return UserModel(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      locationName: locationName ?? this.locationName,
      coverImageUrl: coverImageUrl ?? this.coverImageUrl,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      createdTime: createdTime ?? this.createdTime,
    );
  }
}
