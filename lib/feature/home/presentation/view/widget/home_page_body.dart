import 'package:bookly_app/core/styles/styles.dart';
import 'package:bookly_app/core/utils/app_strings.dart';
import 'package:bookly_app/feature/home/presentation/view/widget/best_seller_list_view.dart';
import 'package:bookly_app/feature/home/presentation/view/widget/custom_app_bart.dart';
import 'package:bookly_app/feature/home/presentation/view/widget/feature_books_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: CustomAppBar(
            icon: FontAwesomeIcons.magnifyingGlass,
            image: AssetData.logo,
          ),
        ),
        SliverToBoxAdapter(
          child: FeaturedBooksListView(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 20.0,
          ),
        ),
        SliverToBoxAdapter(
          child: Text(
            'Best Seller',
            style: Styles.titleMeduim,
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 10.0,
          ),
        ),
        SliverToBoxAdapter(
          child: BestSellerListView(),
        )
      ],
    );
  }
}
