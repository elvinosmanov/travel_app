import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:travel_app/core/cores.dart';
import 'package:travel_app/cubit/like/like_cubit.dart';
import 'package:travel_app/extensions/extensions.dart';
import 'package:travel_app/models/place.dart';

class CategoryCard2 extends StatelessWidget {
  const CategoryCard2({
    Key? key,
    this.textSize,
    this.placeSize,
    this.onPressed,
    this.width,
    this.height,
    required this.placeModel,
  }) : super(key: key);
  final double? textSize;
  final double? placeSize;
  final Function()? onPressed;
  final double? width;
  final double? height;
  final PlaceModel placeModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _buildImageContainer(context),
            Flexible(
              child: Text(
                placeModel.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: kSemiBoldTextStyle(textSize ?? 16),
              ).padding(top: 8, bottom: 6),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SvgPicture.asset(R.mapOutliend),
                Flexible(
                  child: Text(
                    placeModel.location.useCorrectEllipsis(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: kRegularTextStyle(placeSize ?? 12, kDarkGreyColor),
                  ).padding(left: 4),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Material _buildImageContainer(BuildContext context) {
    bool isLiked = false;

    return Material(
      borderRadius: BorderRadius.circular(10),
      elevation: 4,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: placeModel.imageURLs[0],
              width: width ?? double.infinity,
              height: height,
              fit: BoxFit.cover,
              placeholder: (context, _) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
          Positioned(
            top: 13,
            right: 12,
            child: IconButton(
                iconSize: 30,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {
                  context.read<LikeCubit>().likeOrNotPlaces(placeModel.id, isLiked);
                },
                splashRadius: 100,
                icon: BlocSelector<LikeCubit, LikeState, bool>(
                  selector: (state) {
                    return state.checkLike(placeModel.id);
                  },
                  builder: (context, state) {
                    isLiked = state;
                    return SvgPicture.asset(
                      isLiked ? R.heartFilled : R.heartOutlined,
                      fit: BoxFit.scaleDown,
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }
}
