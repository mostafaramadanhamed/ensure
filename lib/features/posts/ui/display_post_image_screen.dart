import 'package:flutter/material.dart';

class DisplayPostImageScreen extends StatelessWidget {
  final String imageUrl;
  const DisplayPostImageScreen({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Image'),
      ),
      body: Center(
          child:
              AspectRatio(aspectRatio: 1 / 3, child: Image.network(imageUrl))),
    );
  }
}
