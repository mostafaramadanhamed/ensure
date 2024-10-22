import 'package:ensure/core/helpers/format_text_helper.dart';
import 'package:ensure/core/helpers/navigation_extension.dart';
import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:ensure/features/posts/data/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/date_time_format_helper.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../domain/cubit/posts_cubit.dart';
import '../../domain/cubit/posts_state.dart';

class PostItem extends StatelessWidget {
  final PostModel post;
  const PostItem({super.key, required this.post});

  // String formatDate(DateTime date) {
  //   var formattedDate = formatPostTime(date);
  //   return formattedDate.toString();
  // }

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.grey.shade300,
      color: Theme.of(context).cardColor,
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      elevation: 8,
      shadowColor: AppColors.melon,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            12.ph,
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(post.authorName, style: TextStyles.font15SemiBold),
              leading: Container(
                height: 40.h,
                width: 40.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                          post.profilePic,
                        ),
                        fit: BoxFit.cover)),
              ),
              trailing: PopupMenuButton(
                itemBuilder: (context) {
                  return [
                    context.read<PostsCubit>().isuser(post.authorId)
                        ? PopupMenuItem(
                            value: 'Edit',
                            child: const Text('Edit'),
                            onTap: () {
                              context.pushNamed(
                                Routes.editPost,
                                arguments: post,
                              );
                            },
                          )
                        : const PopupMenuItem(
                            value: 'About this account',
                            child: Text('Edit'),
                          ),
                    context.read<PostsCubit>().isuser(post.authorId)
                        ? PopupMenuItem(
                            value: 'Delete',
                            child: const Text('Delete',
                                style: TextStyle(color: Colors.red)),
                            onTap: () {
                              context.read<PostsCubit>().deletePost(post.uId);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Post Deleted'),
                                ),
                              );
                            
                            })
                        : const PopupMenuItem(
                            value: 'Unfollow',
                            child: Text('Unfollow'),
                          ),
                    const PopupMenuItem(
                      value: 'Report',
                      child:
                          Text('Report', style: TextStyle(color: Colors.red)),
                    ),
                  ];
                },
              ),
            ),
            20.ph,
            GestureDetector(
              onTap: () {},
              child: Text(
                formatText(post.text),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.font15SemiBold,
              ),
            ),
            20.ph,
            post.content == ''
                ? Container()
                : Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0.r),
                      child: Image.network(post.content,
                          height: 180.h, fit: BoxFit.cover),
                    ),
                  ),
            14.ph,
            BlocBuilder<PostsCubit, PostsState>(
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
                      onPressed: () {},
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
            ),
          ],
        ),
      ),
    );
  }
}
