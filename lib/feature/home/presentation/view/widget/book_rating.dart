// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.ratingCount,
    required this.avgCount,
  });
  final MainAxisAlignment mainAxisAlignment;
  final dynamic avgCount;
  final dynamic ratingCount;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffffdd4f),
        ),
        const SizedBox(
          width: 3.0,
        ),
        Text(
          avgCount.toString(),
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(),
        ),
        const SizedBox(
          width: 3.0,
        ),
        Text(
          ' (${ratingCount.toString()})',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.grey),
        )
      ],
    );
  }
}
