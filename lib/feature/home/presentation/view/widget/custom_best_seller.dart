// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:bookly_app/core/app_router.dart';
import 'package:bookly_app/core/styles/styles.dart';
import 'package:bookly_app/feature/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/feature/home/presentation/view/widget/book_rating.dart';
import 'package:bookly_app/feature/home/presentation/view/widget/custom_img.dart';

class CustomBestSeller extends StatelessWidget {
  const CustomBestSeller({
    super.key,
    required this.model,
  });
  final BookModel model;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDeatils, extra: model);
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .2,
        child: Row(
          children: [
            Custom_img(
              imgUrl: model.volumeInfo!.imageLinks!.thumbnail!,
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .6,
                    child: Text(
                      model.volumeInfo!.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.titleMeduim.copyWith(fontFamily: 'Kalam'),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    model.volumeInfo!.authors![0],
                    style: Styles.titleMeduim.copyWith(fontSize: 14.0),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Text(
                        'Free',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      BookRating(
                        avgCount: model.volumeInfo!.pageCount,
                        ratingCount: model.volumeInfo!.pageCount,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
