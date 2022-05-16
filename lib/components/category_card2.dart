import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/core/cores.dart';

class CategoryCard2 extends StatelessWidget {
  const CategoryCard2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 165 / 150,
            child: Image.asset(
              R.mateImage,
              fit: BoxFit.cover,
            ),
          ),
          const Text(
            'The Romanian – Solo  fgdsg afdgfdsgExhibition',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
