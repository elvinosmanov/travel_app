import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:travel_app/repositories/storage_repository.dart';
import 'package:travel_app/repositories/user_repository.dart';

import '../../models/user.dart';
import '../../screens/profile/profile_screen.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final BaseStorageRepository _storageRepository;
  final BaseUserRepository _userRepository;
  UserCubit({BaseStorageRepository? storageRepository, BaseUserRepository? userRepository})
      : _storageRepository = storageRepository ?? StorageRepository(),
        _userRepository = userRepository ?? UserRepository(),
        super(UserState.initial());

  getUserModel(String userId) {
    emit(state.copyWith(status: UserStatus.loading));
    final result = _userRepository.getUser(userId);
    result.listen((userModel) {
      print(userModel);
      emit(state.copyWith(status: UserStatus.success, userModel: userModel));
    })
      ..onData((userModel) {
        print(userModel);
        emit(state.copyWith(status: UserStatus.success, userModel: userModel));
      })
      ..onError((e) {
        emit(state.copyWith(status: UserStatus.error, errorMessage: 'Error: $e'));
      });
  }

  updateUserInformation(
    String? fullName,
    String? locationName,
  ) async {
    emit(state.copyWith(status: UserStatus.loading));
    await _userRepository.updateUserInformation(fullName: fullName, locationName: locationName);
    emit(state.copyWith(status: UserStatus.success));
  }

  updateUserImage(CroppedFile pickedImage, ImageType imageType) async {
    emit(state.copyWith(imageStatus: ImageStatus.loading, imageType: imageType));
    await _storageRepository.uploadImage(pickedImage, imageType);
    emit(state.copyWith(imageStatus: ImageStatus.success, imageType: imageType));
  }
}
