import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> customLancherUrl(String url, BuildContext context) async {
  if (url.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('URL is not available')),
    );
  } else {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode
            .externalApplication, // استخدام المتصفح الخارجي لفتح الرابط
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch the $url')),
      );
    }
  }
}
