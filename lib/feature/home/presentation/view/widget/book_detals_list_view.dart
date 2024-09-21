import 'package:bookly_app/core/widget/custom_loading_widget.dart';
import 'package:bookly_app/core/widget/custom_text.dart';
import 'package:bookly_app/feature/home/manger/cubit/similar_books_cubit.dart';
import 'package:bookly_app/feature/home/presentation/view/widget/custom_img_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsListView extends StatelessWidget {
  const BookDetailsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SuccessToSimilarBooksState) {
          return SizedBox(
            height: 130,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                width: 10.0,
              ),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return CustomImgItem(
                  imgUrl: state.books[index].volumeInfo!.imageLinks!.thumbnail!,
                );
              },
              itemCount: 5,
            ),
          );
        } else if (state is FailedToSimilarBooksState) {
          return CustomErrText(text: state.errMsg);
        } else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}
