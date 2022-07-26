part of 'user_cubit.dart';

enum UserStatus { initial, loading, success, error }

enum ImageStatus { initial, loading, success, error }

class UserState extends Equatable {
  final UserStatus status;
  final ImageStatus imageStatus;
  final ImageType imageType;
  final String errorMessage;

  const UserState(
    this.imageType, {
    required this.status,
    required this.imageStatus,
    required this.errorMessage,
  });

  const UserState.initial()
      : status = UserStatus.initial,
        imageType = ImageType.profile,
        imageStatus = ImageStatus.initial,
        errorMessage = '';
  @override
  List<Object> get props => [status, errorMessage, imageStatus];

  UserState copyWith({
    UserStatus? status,
    ImageStatus? imageStatus,
    UserModel? userModel,
    ImageType? imageType,
    String? errorMessage,
  }) {
    return UserState(imageType ?? this.imageType,
        status: status ?? this.status,
        imageStatus: imageStatus ?? this.imageStatus,
        errorMessage: errorMessage ?? this.errorMessage);
  }
}
