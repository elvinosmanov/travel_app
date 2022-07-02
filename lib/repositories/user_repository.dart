import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_app/core/constants.dart';
import 'package:travel_app/repositories/storage_repository.dart';

import '../models/user.dart';

class UserRepository extends BaseUserRepository {
  final CollectionReference _userPlaceRef = FirebaseFirestore.instance.collection('users');
  @override
  Future<void> updateUserImage(String imageName) async {
    String downloadUrl = await StorageRepository().getDownloadUserImageUrl(imageName);
    _userPlaceRef.doc(kTemporaryUserId).update({'${imageName}_url': downloadUrl});
  }

  @override
  Future<void> updateUserInformation({
    String? fullName,
    String? username,
    String? locationName,
  }) async {
    await _userPlaceRef.doc(kTemporaryUserId).update({
      if (fullName != null) 'full_name': fullName,
      if (username != null) 'username': username,
      if (locationName != null) 'location_name': locationName,
    });
  }

  @override
  Stream<UserModel> getUser(String userId) {
    return _userPlaceRef.doc(userId).snapshots().map((snap) {
      return UserModel.fromSnapshot(snap);
    });
  }
  
  @override
  Future<void> createUser(UserModel userModel) async {
   await _userPlaceRef.doc(userModel.id).set(userModel.toMap());
  }
}

abstract class BaseUserRepository {
  Future<void> updateUserInformation({
    String? fullName,
    String? username,
    String? locationName,
  });
  Future<void> updateUserImage(String imageName);
  Future<void> createUser(UserModel userModel);
  Stream<UserModel> getUser(String userId);
}
