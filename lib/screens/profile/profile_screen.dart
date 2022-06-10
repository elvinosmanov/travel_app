import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_app/core/constants.dart';
import 'package:travel_app/core/cores.dart';
import 'package:travel_app/extensions/extensions.dart';
import 'package:travel_app/routes/router.gr.dart';
import 'package:travel_app/screens/profile/widgets/modal_bottom_sheet.dart';
import 'package:image_cropper/image_cropper.dart';

enum ImageType { cover, profile }

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  CroppedFile? _croppedProfileImage;
  CroppedFile? _croppedCoverImage;

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
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: <Widget>[
          _buildCustomAppBar().padding(top: defaultTopPadding, bottom: 16),
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
        // width: 1000,
        // height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        // child: AspectRatio(
        //   aspectRatio: 6 / 2.85,
        //   child: _croppedCoverImage != null
        //       ? Image.file(
        //           File(_croppedCoverImage!.path),
        //           fit: BoxFit.cover,
        //         )
        //       : 
        //       Image.asset(
        //           R.museumAndArtImage,
        //           fit: BoxFit.cover,
        //         ),
        // ),
      ),
    );
  }

  Row _buildCustomAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        'elvinosmanov'.semiBoldTextStyle(18, kBlueColor),
        IconButton(
          onPressed: () => context.router.pushNamed('/settings/'),
          icon: SvgPicture.asset(
            R.settings,
            fit: BoxFit.scaleDown,
          ),
        )
      ],
    );
  }

  Positioned _buildUserInformation() {
    return Positioned(
      bottom: 0,
      left: 24,
      child: Row(
        children: [
          GestureDetector(
            onTap: () => showBottomSheet(ImageType.profile),
            child: Stack(
              children:  [
                CircleAvatar(
                  radius: 70,
                  backgroundColor: kLightGreyColor_1,
                  child: 
                  CircleAvatar(
                      radius: 66,
                      backgroundImage: _croppedProfileImage != null
                          ? FileImage(File(_croppedProfileImage!.path)) as ImageProvider
                          : const AssetImage(R.flagInterestImage)),
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
              'Elvin Osmanov'.semiBoldTextStyle(22),
              'Baku, Azerbaijan'.mediumTextStyle(13),
            ],
          ).padding(top: 20, left: 4),
        ],
      ),
    );
  }

  void _getFromGallery(ImageType imageType) async {
    ImagePicker imagePicker = ImagePicker();
    XFile? pickedImage = await imagePicker.pickImage(source: ImageSource.gallery, maxHeight: 1080, maxWidth: 1080);
    if (imageType == ImageType.profile) {
      _cropProfileImage(pickedImage!.path);
    } else if (imageType == ImageType.cover) {
      _cropCoverImage(pickedImage!.path);
    }
    context.router.pop();
  }

  void _cropProfileImage(String path) async {
    CroppedFile? croppedImage = await ImageCropper().cropImage(
        sourcePath: path,
        maxHeight: 1080,
        maxWidth: 1080,
        compressQuality: 100,
        cropStyle: CropStyle.circle,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1));
    if (croppedImage != null) {
      setState(() {
        _croppedProfileImage = croppedImage;
      });
    }
  }

  void _cropCoverImage(String path) async {
    CroppedFile? croppedImage = await ImageCropper().cropImage(
        sourcePath: path,
        maxHeight: 1080,
        maxWidth: 1080,
        compressQuality: 100,
        aspectRatio: const CropAspectRatio(ratioX: 6, ratioY: 2.85));
    if (croppedImage != null) {
      setState(() {
        _croppedCoverImage = croppedImage;
      });
    }
  }
}
