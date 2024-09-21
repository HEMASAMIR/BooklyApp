import 'package:bookly_app/core/widget/custom_loading_widget.dart';
import 'package:bookly_app/core/widget/custom_text.dart';
import 'package:bookly_app/feature/home/manger/newset_books/cubit/newset_books_cubit.dart';
import 'package:bookly_app/feature/home/presentation/view/widget/custom_best_seller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBooksCubit, NewsetBooksState>(
      builder: (context, state) {
        if (state is SusseccToNewsetBooksState) {
          return ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return CustomBestSeller(
                  model: state.books[index],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                    height: 5.0,
                  ),
              itemCount: state.books.length);
        } else if (state is FailedToNewsetBooksState) {
          return CustomErrText(text: state.errMsg);
        } else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}
