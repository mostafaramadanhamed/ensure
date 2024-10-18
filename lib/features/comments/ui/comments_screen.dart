import 'package:ensure/features/comments/ui/widgets/add_comment_input.dart';
import 'package:ensure/features/comments/ui/widgets/comments_list_view.dart';
import 'package:ensure/features/posts/domain/cubit/posts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentsScreen extends StatelessWidget {
  final int postId;
  const CommentsScreen({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Comments'),
          leading:  IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
              context.watch<PostsCubit>().getPosts();
            },
          ),
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
