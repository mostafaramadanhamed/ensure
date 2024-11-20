import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Explore'.tr()),
      centerTitle: true,
      ),
      body: Center(
        child: Text('Explore'.tr()),
      ),
      );
  }
}