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
              trailing: GestureDetector(
                  onTap: () {}, child: const Icon(Icons.more_horiz_rounded)),
            ),
            20.ph,
            Text(
              post.text,
              style: TextStyles.font15SemiBold,
            ),
            20.ph,
            post.content == ''
                ? Container()
                : ClipRRect(
                    borderRadius: BorderRadius.circular(16.0.r),
                    child: Image.network('https://picsum.photos/400/300',
                        fit: BoxFit.cover),
                  ),
            14.ph,
            BlocBuilder<PostsCubit, PostsState>(
              builder: (context, state) {
                // Check if the state contains the likes data
                bool isLiked = false; // Default to false
                int likes =
                    post.likes; // Initialize with the post's current likes

                if (state is LikePostSuccess && state.postId == post.uId) {
                  // Update likes count if the likes have been updated
                  likes =
                      state.likes;
                                        isLiked = true;
 // Use the updated likes count from the state
                } else if (state is IsPostLikedSuccess) {
                  // Check if the post is liked in the initial state
                  debugPrint(state.isLiked.toString());
                  isLiked = state.isLiked;
                }

                return Row(
                  children: [
                    IconButton(
                      onPressed: () async {
                        if (isLiked) {
                          debugPrint(isLiked.toString());
                          await context.read<PostsCubit>().unlikePost(post.uId);
                        } else {
                          debugPrint(isLiked.toString());
                          await context
                              .read<PostsCubit>()
                              .likePostAndUpdateState(post.uId);
                        }
                        // The UI will automatically update due to BlocBuilder
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: isLiked ? Colors.red : Colors.grey,
                      ),
                    ),
                   likes == 0 ? Container() : Text(
                      likes.toString(),
                      style: TextStyles.font12LighterBrownBold,
                    ),
                    8.ph,
                    IconButton(
                      onPressed: () {
                        context.pushNamed(Routes.comments, arguments: post.uId);
                      },
                      icon: const Icon(Icons.comment),
                    ),
                post.comments == 0 ? Container() :    Text(
                      post.comments.toString(),
                      style: TextStyles.font12LighterBrownBold,
                    ),
                    8.ph,
                  
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.share),
                    ),  
                       const Spacer(),  Text(
                      formatPostTime(post.creatdAt),
                      style: TextStyles.font12LighterBrownBold,
                    ),
               
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
