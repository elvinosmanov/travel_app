part of 'user_cubit.dart';

enum UserStatus { initial, loading, success, error }

enum ImageStatus { initial, loading, success, error }

class UserState extends Equatable {
  final UserStatus status;
  final ImageStatus imageStatus;
  final UserModel userModel;
  final String errorMessage;
  const UserState({
    required this.status,
    required this.imageStatus,
    required this.userModel,
    required this.errorMessage,
  });

  UserState.initial()
      : status = UserStatus.initial,
        imageStatus = ImageStatus.initial,
        userModel = UserModel.empty,
        errorMessage = '';
  @override
  List<Object> get props => [status, userModel, errorMessage];

  UserState copyWith({
    UserStatus? status,
    ImageStatus? imageStatus,
    UserModel? userModel,
    String? errorMessage,
  }) {
    return UserState(
      status: status ?? this.status,
      imageStatus: imageStatus ?? this.imageStatus,
      userModel: userModel ?? this.userModel,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
