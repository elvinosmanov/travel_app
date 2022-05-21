import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:travel_app/components/custom_back_button.dart';
import 'package:travel_app/core/constants.dart';
import 'package:travel_app/core/cores.dart';
import 'package:travel_app/extensions/extensions.dart';
import '../../components/search_textfield.dart';
//TODO: search etmeyin isleri coxdu. Bu hisseni yarimciq qoyuram bura diqqet et
class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _controller = ScrollController();
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.position.pixels < 0) _controller.jumpTo(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const CustomBackButton().padding(top: defaultTopPadding, bottom: 16),
          const SearchTextField(),
          'Recent'.semiBoldTextStyle(18).padding(top: 24, bottom: 8, left: 16),
          Expanded(
            child: ListView.builder(
              controller: _controller,
              physics: const BouncingScrollPhysics(),
              itemCount: 30,
              itemBuilder: (context, index) {
                return const _SearchResult(
                    'BlackBird Coffee BlackBird CoffeeBlackBird CoffeeBlackBird CoffeeBlackBird CoffeeBlackBird CoffeeBlackBird CoffeeBlackBird Coffee');
              },
            ),
          )
        ],
      ),
    );
  }
}

class _SearchResult extends StatelessWidget {
  const _SearchResult(this.text, {Key? key}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Row(
        children: <Widget>[
          SvgPicture.asset(R.searchThin).padding(right: 10),
          Flexible(
            child: Text(
              text.useCorrectEllipsis(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
