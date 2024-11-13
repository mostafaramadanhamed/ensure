import 'package:ensure/features/comments/domain/cubit/comments_cubit.dart';
import 'package:ensure/features/comments/domain/cubit/comments_state.dart';
import 'package:ensure/features/comments/ui/widgets/comment_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'shimmer_comment_loading.dart';

class CommentsListView extends StatefulWidget {
  final int postId;
  const CommentsListView({super.key, required this.postId});

  @override
  State<CommentsListView> createState() => _CommentsListViewState();
}

class _CommentsListViewState extends State<CommentsListView> {
  @override
  void initState() {
    super.initState();

    context.read<CommentsCubit>().getComments(widget.postId);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentsCubit, CommentsState>(
      builder: (context, state) {
        if (state is GetCommentsSuccess) {
          return ListView.builder(
            itemCount: state.comments.length,
            itemBuilder: (context, index) {
              return CommentItem(comment: state.comments[index]);
            },
          );
        } else if (state is GetCommentsError) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is GetCommentsLoading) {
          return const ShimmerCommentLoading();
        }
        return const SizedBox.shrink();
      },
    );
  }
}
