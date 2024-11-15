import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DisplayPostImageScreen extends StatelessWidget {
  final String imageUrl;
  const DisplayPostImageScreen({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Post Image'.tr()),
      ),
      body: Center(
          child:
              AspectRatio(aspectRatio: 1 / 3, child: Image.network(imageUrl))),
    );
  }
}
