import 'package:ensure/features/posts/ui/widgets/add_comment_input.dart';
import 'package:ensure/features/posts/ui/widgets/comments_list_view.dart';
import 'package:flutter/material.dart';

class CommentsScreen extends StatelessWidget {
  final int postId;
  const CommentsScreen({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Comments'),
        ),
        body: const Column(
          children: [
            Expanded(
              child: CommentsListView(),
            ),
            AddCommentInput(),
          ],
        ));
  }
}
