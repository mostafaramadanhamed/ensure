
import 'package:ensure/core/helpers/navigation_extension.dart';
import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/helpers/date_time_format_helper.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/text_styles.dart';
import '../../data/models/post_model.dart';
import '../../domain/cubit/posts_cubit.dart';
import '../../domain/cubit/posts_state.dart';

class ReactsBlocBuilder extends StatelessWidget {
  const ReactsBlocBuilder({
    super.key,
    required this.post,
  });

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsCubit, PostsState>(
      builder: (context, state) {
        // Check if the state contains the likes data
        bool isLiked = false;
        int likes = post.likes;
    
        // Update likes count if the post has been liked
        if (state is IsPostLikedSuccess && state.postId == post.uId) {
          isLiked = state.isLiked; // Update based on initial fetch
        }
        if (state is GetPostsSuccess) {
          context.read<PostsCubit>().isPostLiked(post.uId);
        }
    
        // Update likes count and isLiked after liking the post
        if (state is LikePostSuccess && state.postId == post.uId) {
          likes = state.likes; // Use the updated likes count
          isLiked = true; // Ensure the UI shows the post is liked
        }
    
        // Update likes count and isLiked after unliking the post
        if (state is UnlikePostSuccess && state.postId == post.uId) {
          likes = state.likes; // Use the updated likes count
          isLiked = false; // Ensure the UI shows the post is not liked
        }
    
        return Row(
          children: [
            IconButton(
              onPressed: () async {
                if (isLiked) {
                  await context.read<PostsCubit>().unlikePost(post.uId);
                } else {
                  await context
                      .read<PostsCubit>()
                      .likePostAndUpdateState(post.uId);
                }
                debugPrint(isLiked.toString());
              },
              icon: Icon(
                Icons.favorite,
                color: isLiked ? Colors.red : Colors.grey,
              ),
            ),
            likes == 0
                ? Container()
                : Text(
                    likes.toString(),
                    style: TextStyles.font12LighterBrownBold,
                  ),
            8.ph,
            IconButton(
              onPressed: () {
                context.pushNamed(Routes.comments, arguments: post.uId);
    
                context.read<PostsCubit>().getPosts(); // Refresh posts
              },
              icon: const Icon(Icons.comment),
            ),
            post.comments == 0
                ? Container()
                : Text(
                    post.comments.toString(),
                    style: TextStyles.font12LighterBrownBold,
                  ),
            8.ph,
            IconButton(
              onPressed: () {
                Share.share(post.text);
              },
              icon: const Icon(Icons.share),
            ),
            const Spacer(),
            Text(
              formatPostTime(post.creatdAt),
              style: TextStyles.font12LighterBrownBold,
            ),
          ],
        );
      },
    );
  }
}
