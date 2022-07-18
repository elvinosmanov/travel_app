import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maps_launcher/maps_launcher.dart';

import 'package:travel_app/components/category_bar.dart';
import 'package:travel_app/components/category_card2.dart';
import 'package:travel_app/components/custom_comment.dart';
import 'package:travel_app/components/custom_divider.dart';
import 'package:travel_app/components/custom_opacity_button.dart';
import 'package:travel_app/core/constants.dart';
import 'package:travel_app/core/cores.dart';
import 'package:travel_app/cubit/comment/comments_cubit.dart';
import 'package:travel_app/cubit/like/like_cubit.dart';
import 'package:travel_app/cubit/place/place_cubit.dart';
import 'package:travel_app/cubit/will_visit/will_visit_cubit.dart';
import 'package:travel_app/extensions/extensions.dart';
import 'package:travel_app/models/user.dart';
import 'package:travel_app/routes/router.gr.dart';
// ignore: depend_on_referenced_packages
import 'package:latlong2/latlong.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../components/custom_rating_bar.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    Key? key,
    @PathParam('id') required this.placeId,
  }) : super(key: key);
  final String placeId;
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool isReadmore = false;
  final _controller = ScrollController();
  late MapController mapController;
  UserModel? user;
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.position.pixels < 0) _controller.jumpTo(0);
    });
    context.read<PlaceCubit>().increamantViewCount(widget.placeId);
    context.read<PlaceCubit>().getPlaceById(widget.placeId);
    context.read<CommentCubit>().getAllCommentsByPlaceId(widget.placeId);
  }

  @override
  Widget build(BuildContext context) {
    user = context.watch<AuthBloc>().state.user;
    context.watch<WillVisitCubit>().getAllUserWillVisits(user!.id!);
    return BlocBuilder<PlaceCubit, PlaceState>(
      builder: (context, state) {
        return Scaffold(
          body: ListView(
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            controller: _controller,
            children: <Widget>[
              DetailsImageContainer(
                imageUrls: state.placeModel.imageURLs,
                placeId: widget.placeId,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _buildTwoChildrenRow(
                      SvgPicture.asset(R.eyeBlack), state.placeModel.viewCount.viewCountToString().mediumTextStyle(15)),
                  _buildTwoChildrenRow(
                      state.placeModel.rateAvgCount.toStringAsFixed(1).mediumTextStyle(15),
                      CustomRatingBar(
                        initialRating: state.placeModel.rateAvgCount,
                      )),
                  BlocSelector<CommentCubit, CommentState, int>(
                    selector: (state) {
                      return state.comments.length;
                    },
                    builder: (context, state) {
                      return _buildTwoChildrenRow(state.toString().mediumTextStyle(15), SvgPicture.asset(R.comment));
                    },
                  ),
                  _buildTwoChildrenRow(
                      state.placeModel.likeCount.toString().mediumTextStyle(15), SvgPicture.asset(R.heartFilledBlack))
                ],
              ).padding(all: 16),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomDivider(),
                    state.placeModel.title.heading1().padding(top: 32, bottom: 4),
                    Row(
                      children: <Widget>[
                        SvgPicture.asset(R.map, fit: BoxFit.scaleDown).padding(right: 2),
                        state.placeModel.locationName.semiBoldTextStyle(15, kDarkGreyColor)
                      ],
                    ),
                    CustomVisitButton(
                      placeId: state.placeModel.id,
                    ),
                    'About'.semiBoldTextStyle(18).padding(top: 16, bottom: 10),
                    buildText(state.placeModel.description),
                  ],
                ),
              ),
              if (state.placeModel.description.length > kMaxDisplayableDescriptionLength)
                _buildReadMoreButton().padding(left: 8),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16, top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    'Location'.semiBoldTextStyle(18).padding(top: 16, bottom: 10),
                    _buildMap(state),
                    'Comments'.semiBoldTextStyle(22).padding(top: 24, bottom: 16),
                  ],
                ),
              ),
              BlocBuilder<CommentCubit, CommentState>(
                builder: (context, state) {
                  return state.status == CommentStatus.loading
                      ? const Center(child: CircularProgressIndicator())
                      : Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildCommentList(),
                            if (state.comments.isEmpty)
                              GestureDetector(
                                onTap: () => context.router.push(AllCommentsRoute(placeId: widget.placeId)),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgPicture.asset(
                                      R.noComments,
                                      height: 80,
                                    ),
                                    FittedBox(
                                            child: 'There are no comments yet. Would you like to write a comment?'
                                                .regularTextStyle(12, kGoogleRedColor)
                                                .padding(top: 8))
                                        .padding(left: 16, right: 16, top: 8)
                                  ],
                                ).padding(bottom: 32),
                              )
                            else
                              _buildSeeAllReviewsButton().padding(bottom: 32),
                          ],
                        );
                },
              ),
              CategoryBar(
                categoryName: 'Places May You Like',
                color: kBlueColor,
                onPressed: () {
                  return context.router.push(AllCategoriesRoute());
                },
              ).padding(bottom: 16),
              _buildCardList().padding(bottom: 16)
            ],
          ),
        );
      },
    );
  }

  Widget _buildCardList() {
    return BlocBuilder<PlaceCubit, PlaceState>(
      builder: (context, state) {
        return SizedBox(
          height: 180,
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(left: 16),
              scrollDirection: Axis.horizontal,
              itemCount: state.places.length,
              itemBuilder: (context, index) {
                return CategoryCard2(
                  width: 150,
                  height: 130,
                  placeModel: state.places[index],
                  onPressed: () => context.router.push(
                    DetailsRoute(placeId: state.places[index].id),
                  ),
                ).padding(right: 16);
              }),
        );
      },
    );
  }

  Row _buildSeeAllReviewsButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () => context.router.push(AllCommentsRoute(placeId: widget.placeId)),
          child: ('See All Reviews').mediumTextStyle(13, kDarkGreyColor),
        )
      ],
    );
  }

  Widget _buildCommentList() {
    return BlocBuilder<CommentCubit, CommentState>(
      buildWhen: (previous, current) => previous.comments != current.comments,
      builder: (context, state) {
        return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.comments.length <= 3 ? state.comments.length : 3,
            itemBuilder: (context, index) {
              return CustomComment(
                commentModel: state.comments[index],
              );
            });
      },
    );
  }

  GestureDetector _buildReadMoreButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isReadmore = !isReadmore;
        });
      },
      child: (!isReadmore ? 'Read more' : 'Read less').mediumTextStyle(15, kBlueColor).padding(all: 8),
    );
  }

  Container _buildMap(PlaceState state) {
    final loc = state.placeModel.location;
    mapController = MapController();
    mapController.onReady.then((value) {
      setState(() {
        mapController.move(LatLng(loc.latitude, loc.longitude), 8);
      });
    });

    return Container(
      clipBehavior: Clip.hardEdge,
      width: double.infinity,
      height: 220,
      decoration: BoxDecoration(
        borderRadius: kRadius16,
      ),
      child: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              center: LatLng(loc.latitude, loc.longitude),
              zoom: 8,
            ),
            layers: [
              TileLayerOptions(
                  urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", subdomains: ['a', 'b', 'c']),
              // TileLayerOptions(
              //   urlTemplate: "https://tile.thunderforest.com/atlas/{z}/{x}/{y}.png?apikey={apikey}",
              //   additionalOptions: {"apikey": "c4bce2e5f7b14c28883efe9268d0de1d"},
              // ),
              MarkerLayerOptions(
                markers: [
                  Marker(
                    point: LatLng(loc.latitude, loc.longitude),
                    builder: (ctx) => SvgPicture.asset(
                      width: 35.0,
                      height: 35.0,
                      R.map,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: () {
                MapsLauncher.launchCoordinates(loc.latitude, loc.longitude);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                decoration: const BoxDecoration(
                    color: kRedColor, borderRadius: BorderRadius.only(topLeft: Radius.circular(16))),
                child: 'Get Direction'.mediumTextStyle(15, kWhiteColor),
              ),
            ),
          )
        ],
      ),
    );
  }

  Row _buildTwoChildrenRow(Widget widget1, Widget widget2) {
    return Row(
      children: <Widget>[widget1.padding(right: 6), widget2],
    );
  }

  buildText(String text) {
    final condition = isReadmore || text.length <= kMaxDisplayableDescriptionLength;
    final lines = condition ? null : 3;
    return Text(
      text,
      style: kRegularTextStyle(15).copyWith(height: 1.4),
      maxLines: lines,
      overflow: condition ? TextOverflow.visible : TextOverflow.ellipsis,
    );
  }
}

class DetailsImageContainer extends StatefulWidget {
  const DetailsImageContainer({
    Key? key,
    required this.imageUrls,
    required this.placeId,
  }) : super(key: key);
  final List<String> imageUrls;
  final String placeId;
  @override
  State<DetailsImageContainer> createState() => _DetailsImageContainerState();
}

class _DetailsImageContainerState extends State<DetailsImageContainer> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  UserModel? user;
  @override
  Widget build(BuildContext context) {
    user = context.watch<AuthBloc>().state.user;
    return Stack(
      children: [
        CarouselSlider(
          items: widget.imageUrls
              .map((imageUrl) => FractionallySizedBox(
                    widthFactor: 1 / 1.01,
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      width: 1000.0,
                      fit: BoxFit.cover,
                      placeholder: (context, _) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ))
              .toList(),
          carouselController: _controller,
          options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 0.4,
              viewportFraction: 1.01,
              initialPage: 0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        _buildButtonRow(),
        Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                  decoration: BoxDecoration(color: kWhiteColor.withOpacity(0.57), borderRadius: kRadius16),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.imageUrls.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () {
                          _controller.animateToPage(entry.key);
                        },
                        child: Container(
                          width: 8.0,
                          height: 8.0,
                          margin: const EdgeInsets.symmetric(horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current == entry.key ? kBlueColor : kDarkGreyColor,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ))
      ],
    );
  }

  Positioned _buildButtonRow() {
    bool isLiked = false;
    return Positioned(
      top: 40,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomOpacityButton(
            imageName: R.backArrow,
            onPressed: () {
              context.router.pop();
            },
          ),
          BlocSelector<LikeCubit, LikeState, bool>(
            selector: (state) {
              return state.checkLike(widget.placeId);
            },
            builder: (context, state) {
              isLiked = state;
              return CustomOpacityButton(
                imageName: isLiked ? R.heartFilled : R.heartOutlined,
                onPressed: () {
                  context.read<LikeCubit>().likeOrNotPlaces(widget.placeId, isLiked, user!.id!);
                },
              );
            },
          ),
        ],
      ).padding(left: 32, right: 32),
    );
  }
}

class CustomVisitButton extends StatefulWidget {
  const CustomVisitButton({
    Key? key,
    required this.placeId,
  }) : super(key: key);
  final String placeId;
  @override
  State<CustomVisitButton> createState() => _CustomVisitButtonState();
}

class _CustomVisitButtonState extends State<CustomVisitButton> {
  bool willVisit = false;
  UserModel? user;
  @override
  Widget build(BuildContext context) {
    user = context.watch<AuthBloc>().state.user;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        BlocSelector<WillVisitCubit, WillVisitState, bool>(
          selector: (state) {
            return state.checkWillVisit(widget.placeId);
          },
          builder: (context, state) {
            willVisit = state;
            return ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(willVisit ? kLightBlueColor : kWhiteColor),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
                padding: MaterialStateProperty.all(const EdgeInsets.all(5)),
              ),
              onPressed: () {
                context.read<WillVisitCubit>().willVisitOrNotPlaces(widget.placeId, willVisit, user!.id!);
              },
              child: Row(
                children: <Widget>[
                  SvgPicture.asset(R.worldMap).padding(right: 4),
                  (willVisit ? 'Will visit' : 'Will not visit').semiBoldTextStyle(14, kBlueColor)
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
