import 'package:bookly_app/feature/home/presentation/view/widget/book_detals_list_view.dart';
import 'package:flutter/material.dart';

class SimilarBooksLikes extends StatelessWidget {
  const SimilarBooksLikes({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'You can also Like :',
              style: TextStyle(fontWeight: FontWeight.w600),
            )),
        SizedBox(
          height: 20.0,
        ),
        BookDetailsListView(),
      ],
    );
  }
}
