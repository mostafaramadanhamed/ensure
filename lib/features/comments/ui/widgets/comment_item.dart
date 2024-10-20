import 'package:ensure/core/helpers/date_time_format_helper.dart';
import 'package:ensure/core/theme/text_styles.dart';
import 'package:ensure/features/comments/data/models/comment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/cubit/comments_cubit.dart';

class CommentItem extends StatelessWidget {
  final CommentModel comment;
  const CommentItem({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return   ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
           comment.authorProfilePic,),
        radius: 20,
      ),
      title: Text(comment.authorName, style: TextStyles.font15SemiBold),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(comment.content, style: TextStyles.font15Regular),
          const SizedBox(height: 5),
          Text(formatPostTime(comment.createdAt), style: TextStyles.font12LighterBrownBold),
        ],
      ),
      trailing:  GestureDetector(
        onTap: () {
          context.read<CommentsCubit>().deleteComment(comment.commentId, comment.postId);
          
        },
        child: const Icon(Icons.delete_outline_rounded)),
    );
  }
}