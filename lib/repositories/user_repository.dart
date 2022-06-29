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
  Stream<UserModel> getUser() {
    return _userPlaceRef.doc(kTemporaryUserId).snapshots().map((snap) {
      print('girdi');

      print(UserModel.fromSnapshot(snap));
      print('cixdi');
      return UserModel.fromSnapshot(snap);
    });
  }
}

abstract class BaseUserRepository {
  Future<void> updateUserImage(String imageName);
  Stream<UserModel> getUser();
}
