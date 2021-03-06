import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:travel_app/components/custom_back_button.dart';
import 'package:travel_app/core/constants.dart';
import 'package:travel_app/cubit/category/category_cubit.dart';
import 'package:travel_app/extensions/extensions.dart';
import 'package:travel_app/routes/router.gr.dart';

import '../../components/category_card.dart';
import '../../core/cores.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomBackButton(
              onPressed: () => context.router.pop(),
            ).padding(top: defaultTopPadding, left: 16, bottom: 32),
            'Categories'.heading2().padding(left: 16, bottom: 8),
            const CategoryGridView(),
          ],
        ),
      ),
    );
  }
}

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          BlocBuilder<CategoryCubit, CategoryState>(
            buildWhen: (previous, current) => previous.categoryList!=current.categoryList,
            builder: (context, state) {
              return GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 8),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    childAspectRatio: 167 / 130,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: state.categoryList.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return CategoryCard(
                      onPressed: () =>
                          context.router.push(AllCategoriesRoute(selectedCategory: state.categoryList[index])),
                      textSize: 14,
                      image: state.categoryList[index]!.imageURL,
                      title: state.categoryList[index]!.name,
                    );
                  });
            },
          ),
          Container(
            // margin: const EdgeInsets.only(left: 16, right: 16),
            height: 10,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.3, 1],
                tileMode: TileMode.mirror,
                colors: [kLightGreyColor_1, kLightGreyColor_1.withOpacity(0.05)],
              ),
            ),
          )
        ],
      ),
    );
  }
}
