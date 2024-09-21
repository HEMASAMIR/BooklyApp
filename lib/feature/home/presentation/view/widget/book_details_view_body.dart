// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:bookly_app/feature/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/feature/home/presentation/view/widget/book_details_app_bar.dart';
import 'package:bookly_app/feature/home/presentation/view/widget/book_rating.dart';
import 'package:bookly_app/feature/home/presentation/view/widget/custom_book_action.dart';
import 'package:bookly_app/feature/home/presentation/view/widget/custom_img_item.dart';
import 'package:bookly_app/feature/home/presentation/view/widget/similiar_books_likes.dart';

class BokkDetailsViewBody extends StatelessWidget {
  const BokkDetailsViewBody({
    super.key,
    required this.model,
  });
  final BookModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40.0,
            ),
            const BookDetailsAppBar(),
            CustomImgItem(
              imgUrl: model.volumeInfo!.imageLinks?.thumbnail ?? '',
            ),
            const SizedBox(
              height: 15.0,
            ),
            Text(
              model.volumeInfo!.title!,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 18.0,
                    fontFamily: 'Kalam',
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              model.volumeInfo!.authors![0],
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                    // fontFamily: 'Gt',
                    color: Colors.grey,
                  ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const BookRating(
              mainAxisAlignment: MainAxisAlignment.center,
              avgCount: 0,
              ratingCount: 0,
            ),
            const SizedBox(
              height: 37.0,
            ),
            BookActionButton(
              bookModel: model,
            ),
            const SizedBox(
              height: 20.0,
            ),
            const SimilarBooksLikes()
          ],
        ),
      ),
    );
  }
}
