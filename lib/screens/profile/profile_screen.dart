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

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  CroppedFile? _croppedImage;

  void showBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: kWhiteColor,
      elevation: 2,
      barrierColor: Colors.black54,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (context) {
        return CustomModalBottomSheet(
          title: 'Profile Photo',
          galleryOnPressed: _getFromGallery,
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
          const SizedBox(height: 120),
          Expanded(
            child: AutoTabsRouter.tabBar(
              routes: const [
                MyFavoritesTab(),
                RatingsTab(),
                WillVisitTab(),
              ],
              builder: (context, child, tabController) {
                return Container(
                  color: Colors.red,
                  child: Scaffold(
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
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  ClipRRect _buildCoverPhoto() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        R.museumAndArtImage,
        width: 1000,
        height: 200,
        fit: BoxFit.cover,
      ),
    );
  }

  Row _buildCustomAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        'elvinosmanov'.semiBoldTextStyle(18, kBlueColor),
        SvgPicture.asset(
          R.settings,
          fit: BoxFit.scaleDown,
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
          InkWell(
            onTap: () => showBottomSheet(),
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundColor: kLightGreyColor_1,
                  child: CircleAvatar(
                      radius: 66,
                      backgroundImage: AssetImage(_croppedImage != null ? _croppedImage!.path : R.accomodationImage)),
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

  void _getFromGallery() async {
    ImagePicker _imagePicker = ImagePicker();
    XFile? pickedImage = await _imagePicker.pickImage(source: ImageSource.gallery, maxHeight: 1080, maxWidth: 1080);
    _cropImage(pickedImage!.path);
    context.router.pop();
  }

  void _cropImage(String path) async {
    CroppedFile? croppedImage = await ImageCropper().cropImage(sourcePath: path, maxHeight: 1080, maxWidth: 1080);
    if (croppedImage != null) {
      setState(() {
        _croppedImage = croppedImage;
      });
    }
  }
}
