// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bookly_app/core/widget/lancher_url.dart';
import 'package:flutter/material.dart';
import 'package:bookly_app/feature/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/feature/home/presentation/view/widget/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';

class BookActionButton extends StatelessWidget {
  const BookActionButton({
    super.key,
    required this.bookModel,
  });
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            onPressed: () {},
            bgColor: Colors.white,
            textColor: Colors.black,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16.0),
              bottomLeft: Radius.circular(16.0),
            ),
            text: 'Free',
          ),
        ),
        Expanded(
          child: CustomButton(
            onPressed: () async {
              customLancherUrl(bookModel.volumeInfo!.previewLink!, context);
            },
            bgColor: const Color(0XFFED8262),
            textColor: Colors.white,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16.0),
              bottomRight: Radius.circular(16.0),
            ),
            text: getText(bookModel),
          ),
        ),
      ],
    );
  }

  String getText(BookModel bookModel) {
    // نتحقق ما إذا كانت قيمة previewLink موجودة وليست null
    return bookModel.volumeInfo?.previewLink != null
        ? 'Preview'
        : 'Not Available';
  }
}
