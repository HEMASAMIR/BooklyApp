import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Custom_img extends StatelessWidget {
  const Custom_img({
    super.key,
    required this.imgUrl,
  });
  final String imgUrl;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.5 / 4,
      child: CachedNetworkImage(
        imageUrl: imgUrl,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
