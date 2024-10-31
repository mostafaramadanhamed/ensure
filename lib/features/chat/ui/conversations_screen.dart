import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/conversation/conversation_item.dart';

class ConversationsScreen extends StatelessWidget {
  const ConversationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversations'),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: 5,
        separatorBuilder: (context, index) => 16.ph,
        padding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          top: 16.h,
        ),
        itemBuilder: (context, index) => const ConversationItem(),
      ),
    );
  }
}
