import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:travel_app/repositories/user_repository.dart';

import '../screens/profile/profile_screen.dart';

class StorageRepository extends BaseStorageRepository {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  @override
  Future<String> getDownloadUserImageUrl(String imageName, String userId) async {
    String downloadUrl = await _storage.ref('user_$userId/$imageName').getDownloadURL();
    return downloadUrl;
  }

  @override
  Future<void> uploadImage(CroppedFile pickedImage, ImageType imageType, String userId) async {
    String imageName = '';
    switch (imageType) {
      case ImageType.cover:
        imageName = 'cover_image';
        break;
      case ImageType.profile:
        imageName = 'profile_image';
        break;
    }
    try {
      await _storage.ref('user_$userId/$imageName').putFile(File(pickedImage.path)).then((p0) {
        return UserRepository().updateUserImage(imageName,userId);
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}

abstract class BaseStorageRepository {
  Future<void> uploadImage(CroppedFile pickedImage, ImageType imageType, String userId);
  Future<String> getDownloadUserImageUrl(String imageName, String userId);
}
