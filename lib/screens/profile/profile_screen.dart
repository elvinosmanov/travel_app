import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_app/core/constants.dart';
import 'package:travel_app/core/cores.dart';
import 'package:travel_app/cubit/user/user_cubit.dart';
import 'package:travel_app/extensions/extensions.dart';
import 'package:travel_app/models/user.dart';
import 'package:travel_app/routes/router.gr.dart';
import 'package:travel_app/screens/profile/widgets/modal_bottom_sheet.dart';
import 'package:image_cropper/image_cropper.dart';

import '../../bloc/auth/auth_bloc.dart';

enum ImageType { cover, profile }

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void showBottomSheet(ImageType imageType) {
    showModalBottomSheet(
      context: context,
      backgroundColor: kWhiteColor,
      elevation: 4,
      barrierColor: Colors.black.withOpacity(0.8),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (context) {
        return CustomModalBottomSheet(
          title: imageType == ImageType.cover ? 'Choose background photo' : 'Choose profile photo',
          galleryOnPressed: () => _getFromGallery(imageType),
          cameraOnPressed: () => _getFromCamera(imageType),
        );
      },
    );
  }

  UserModel? user;
  @override
  Widget build(BuildContext context) {
    user = context.watch<AuthBloc>().state.user;
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: <Widget>[
          _buildCustomAppBar().padding(top: defaultTopPadding - 10, bottom: 8),
          SizedBox(
            height: 200 + 90,
            child: Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                _buildCoverPhoto(),
                _buildUserInformation(),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: AutoTabsRouter.tabBar(
              routes: const [
                MyFavoritesTab(),
                RatingsTab(),
                WillVisitTab(),
              ],
              builder: (context, child, tabController) {
                return Scaffold(
                  appBar: PreferredSize(
                    preferredSize: const Size.fromHeight(kToolbarHeight),
                    child: TabBar(
                      labelStyle: kMediumTextStyle(13, kDarkGreyColor),
                      labelColor: kBlueColor,
                      unselectedLabelColor: kDarkGreyColor,
                      controller: tabController,
                      tabs: const [
                        Tab(text: 'My Favorites'),
                        Tab(text: 'Ratings'),
                        Tab(text: 'Will Visit'),
                      ],
                    ),
                  ),
                  body: child,
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCoverPhoto() {
    return GestureDetector(
      onTap: () => showBottomSheet(ImageType.cover),
      child: Container(
        clipBehavior: Clip.hardEdge,
        width: 1000,
        height: 200,
        decoration: BoxDecoration(
          color: kLightGreyColor_1,
          borderRadius: BorderRadius.circular(8),
          // boxShadow: const [BoxShadow(color: kBlueColor, spreadRadius: 2)],
        ),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, auth) {
            return BlocBuilder<UserCubit, UserState>(
              buildWhen: (previous, current) => previous.imageStatus != current.imageStatus,
              builder: (context, state) {
                return AspectRatio(
                    aspectRatio: 6 / 2.85,
                    child: auth.user!.coverImageUrl.isEmpty ||
                            (state.imageStatus == ImageStatus.loading && state.imageType == ImageType.cover)
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: auth.user!.coverImageUrl,
                            placeholder: (_, __) {
                              return const Center(child: CircularProgressIndicator());
                            },
                          ));
              },
            );
          },
        ),
      ),
    );
  }

  Row _buildCustomAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return state.user!.username.semiBoldTextStyle(18, kBlueColor);
          },
        ),
        IconButton(
          onPressed: () {
            final router = AutoRouterDelegate.of(context);

            router.controller.navigateNamed('/settings/');
          },
          icon: SvgPicture.asset(
            R.settings,
            fit: BoxFit.scaleDown,
          ),
        )
      ],
    );
  }

  Widget _buildUserInformation() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, auth) {
        return BlocBuilder<UserCubit, UserState>(
          buildWhen: (previous, current) => previous.imageStatus != current.imageStatus,
          builder: (context, state) {
            return Positioned(
              bottom: 0,
              left: 24,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => showBottomSheet(ImageType.profile),
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 70,
                          backgroundColor: kLightGreyColor_1,
                          child: Container(
                            width: 132,
                            height: 132,
                            clipBehavior: Clip.hardEdge,
                            decoration: const BoxDecoration(shape: BoxShape.circle),
                            child: auth.user!.profileImageUrl.isEmpty ||
                                    (state.imageStatus == ImageStatus.loading && state.imageType == ImageType.profile)
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : CachedNetworkImage(
                                    imageUrl: auth.user!.profileImageUrl,
                                    fit: BoxFit.cover,
                                    placeholder: (_, __) {
                                      return const Center(child: CircularProgressIndicator());
                                    },
                                  ),
                          ),
                        ),
                        const Positioned(
                            bottom: 0,
                            right: 0,
                            child: Material(
                              shape: CircleBorder(),
                              elevation: 2,
                              child: CircleAvatar(
                                backgroundColor: kLightGreyColor_1,
                                radius: 25,
                                child: Icon(
                                  Icons.camera_alt_sharp,
                                  color: kBlueColor,
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                  Column(
                    // mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      auth.user!.fullName.semiBoldTextStyle(22),
                      auth.user!.locationName.mediumTextStyle(13),
                    ],
                  ).padding(top: 20, left: 4),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _getFromGallery(ImageType imageType) async {
    ImagePicker imagePicker = ImagePicker();
    XFile? pickedImage = await imagePicker.pickImage(source: ImageSource.gallery, maxHeight: 1080, maxWidth: 1080);
    if (pickedImage != null) {
      if (imageType == ImageType.profile) {
        _cropProfileImage(pickedImage);
      } else if (imageType == ImageType.cover) {
        _cropCoverImage(pickedImage);
      }
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: 'No Image Selected'.mediumTextStyle(13)));
    }
    context.router.pop();
  }

  _getFromCamera(ImageType imageType) async {
    ImagePicker imagePicker = ImagePicker();
    XFile? pickedImage = await imagePicker.pickImage(source: ImageSource.camera, maxHeight: 1080, maxWidth: 1080);
    if (pickedImage != null) {
      if (imageType == ImageType.profile) {
        _cropProfileImage(pickedImage);
      } else if (imageType == ImageType.cover) {
        _cropCoverImage(pickedImage);
      }
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: 'No Image Selected'.mediumTextStyle(13)));
    }
    context.router.pop();
  }

  void _cropProfileImage(XFile pickedImage) async {
    CroppedFile? croppedImage = await ImageCropper().cropImage(
        sourcePath: pickedImage.path,
        maxHeight: 1080,
        maxWidth: 1080,
        compressQuality: 60,
        cropStyle: CropStyle.circle,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1));
    if (croppedImage != null) {
      if (!mounted) return;
      context.read<UserCubit>().updateUserImage(croppedImage, ImageType.profile, user!.id!);
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: 'No Image Selected'.mediumTextStyle(13)));
    }
  }

  void _cropCoverImage(XFile pickedImage) async {
    CroppedFile? croppedImage = await ImageCropper().cropImage(
        sourcePath: pickedImage.path,
        maxHeight: 1080,
        maxWidth: 1080,
        compressQuality: 60,
        aspectRatio: const CropAspectRatio(ratioX: 6, ratioY: 2.85));
    if (croppedImage != null) {
      if (!mounted) return;

      context.read<UserCubit>().updateUserImage(croppedImage, ImageType.cover, user!.id!);
    } else {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: 'No Image Selected'.mediumTextStyle(13)));
    }
  }
}
