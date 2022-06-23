import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_app/core/constants.dart';
import 'package:travel_app/repositories/user_repository.dart';

import '../screens/profile/profile_screen.dart';

class StorageRepository extends BaseStorageRepository {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  @override
  Future<String> getDownloadUserImageUrl(String imageName) async {
    String downloadUrl = await _storage.ref('user_$kTemporaryUserId/$imageName').getDownloadURL();
    return downloadUrl;
  }

  @override
  Future<void> uploadImage(XFile pickedImage, ImageType imageType) async {
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
      await _storage.ref('user_$kTemporaryUserId/$imageName').putFile(File(pickedImage.path)).then((p0) {
        return UserRepository().updateUserImage(imageName);
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}

abstract class BaseStorageRepository {
  Future<void> uploadImage(XFile pickedImage, ImageType imageType);
  Future<String> getDownloadUserImageUrl(String imageName);
}
