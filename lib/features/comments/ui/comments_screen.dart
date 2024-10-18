import 'package:ensure/features/comments/ui/widgets/add_comment_input.dart';
import 'package:ensure/features/comments/ui/widgets/comments_list_view.dart';
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
        body:  Column(
          children: [
            Expanded(
              child: CommentsListView(postId:postId),
            ),
            AddCommentInput(postId: postId,),
          ],
        ));
  }
}
