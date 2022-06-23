import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
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
      _userRepository = userRepository??UserRepository(),
        super(UserState.initial());

  getUserModel(String userId) {
    emit(state.copyWith(status: UserStatus.loading));
    final result = _userRepository.getUser();
    result.listen((userModel) {})
      ..onData((userModel) {
        emit(state.copyWith(status: UserStatus.success, userModel: userModel));
      })
      ..onError((e) {
        emit(state.copyWith(status: UserStatus.error, errorMessage: 'Error: $e'));
      });
  }

  updateUserImage(XFile pickedImage, ImageType imageType) async {
    emit(state.copyWith(imageStatus: ImageStatus.loading));
    await _storageRepository.uploadImage(pickedImage, imageType);
    emit(state.copyWith(imageStatus: ImageStatus.success));
  }
}
