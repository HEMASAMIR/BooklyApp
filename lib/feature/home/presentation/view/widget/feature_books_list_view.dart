// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bookly_app/core/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bookly_app/core/widget/custom_loading_widget.dart';
import 'package:bookly_app/core/widget/custom_text.dart';
import 'package:bookly_app/feature/home/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/feature/home/presentation/view/widget/custom_img_item.dart';
import 'package:go_router/go_router.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({
    super.key,
    this.height = 250,
  });
  final double height;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is SuccessToFeaturedBooksState) {
          return SizedBox(
            height: height,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                width: 10.0,
              ),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kBookDeatils,
                        extra: state.books[index]);
                  },
                  child: CustomImgItem(
                    imgUrl: state.books[index].volumeInfo!.imageLinks!.thumbnail
                        .toString(),
                  ),
                );
              },
              itemCount: state.books.length,
            ),
          );
        } else if (state is FailedToFeaturedBooksState) {
          return CustomErrText(text: state.errMsg);
        } else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}
