// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bookly_app/core/styles/styles.dart';
import 'package:flutter/material.dart';

class CustomErrText extends StatelessWidget {
  const CustomErrText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Styles.titleMeduim
          .copyWith(fontSize: 20.0, fontWeight: FontWeight.w600),
    );
  }
}
