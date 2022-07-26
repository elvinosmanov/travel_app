import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:travel_app/repositories/storage_repository.dart';
import 'package:travel_app/repositories/user_repository.dart';

import '../../models/user.dart';
import '../../repositories/auth_repository.dart';
import '../../screens/profile/profile_screen.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final BaseStorageRepository _storageRepository;
  final BaseUserRepository _userRepository;
  final BaseAuthRepository _authRepository;
  UserCubit({
    BaseStorageRepository? storageRepository,
    BaseUserRepository? userRepository,
    BaseAuthRepository? authRepository,
  })  : _storageRepository = storageRepository ?? StorageRepository(),
        _userRepository = userRepository ?? UserRepository(),
        _authRepository = authRepository ?? AuthRepository(),
        super(const UserState.initial());

  updateUserInformation(String? fullName, String? locationName, String userId) async {
    if (state.status == UserStatus.loading) return;
    emit(state.copyWith(status: UserStatus.loading));
    await _userRepository.updateUserInformation(fullName: fullName, locationName: locationName, userId: userId);
    emit(state.copyWith(status: UserStatus.success));
  }

  Future<void> loginWithCredentials(String email, String password) async {
    if (state.status == UserStatus.loading) return;
    emit(state.copyWith(status: UserStatus.loading));
    try {
      await _authRepository.loginWithEmailAndPassword(email: email, password: password);
      emit(state.copyWith(status: UserStatus.success));
    } catch (_) {}
  }

  Future<void> registerWithCredentials(String email, String password, String username, String fullName) async {
    if (state.status == UserStatus.loading) return;
    emit(state.copyWith(status: UserStatus.loading));
    try {
      final authUser = await _authRepository.signUp(email: email, password: password);
      if (authUser != null) {
        UserModel userModel = UserModel(fullName: fullName, email: email, username: username, id: authUser.uid);
        await _userRepository.createUser(userModel);
        emit(state.copyWith(status: UserStatus.success));
      }
    } catch (_) {}
  }

  updateUserImage(CroppedFile pickedImage, ImageType imageType, String userId) async {
    if (state.imageStatus == ImageStatus.loading) return;
    emit(state.copyWith(imageStatus: ImageStatus.loading, imageType: imageType));
    await _storageRepository.uploadImage(pickedImage, imageType, userId);
    emit(state.copyWith(imageStatus: ImageStatus.success, imageType: imageType));
  }

  Future<void> logout() async {
    await _authRepository.signOut();
  }
}
