import 'package:ensure/features/posts/ui/widgets/comment_item.dart';
import 'package:flutter/material.dart';

class CommentsListView extends StatelessWidget {
  const CommentsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const CommentItem();
              },
            );
  }
}