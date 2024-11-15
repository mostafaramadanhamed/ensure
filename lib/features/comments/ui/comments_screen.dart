import 'package:easy_localization/easy_localization.dart';
import 'package:ensure/features/comments/ui/widgets/add_comment_input.dart';
import 'package:ensure/features/comments/ui/widgets/comments_list_view.dart';
import 'package:flutter/material.dart';

import '../../../core/routing/routes.dart';

class CommentsScreen extends StatelessWidget {
  final int postId;
  const CommentsScreen({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  Text('Comments'.tr()),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.popAndPushNamed(context, Routes.home);
            },
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: CommentsListView(postId: postId),
            ),
            AddCommentInput(
              postId: postId,
            ),
          ],
        ));
  }
}
