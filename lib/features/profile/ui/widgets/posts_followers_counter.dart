import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';

class PostsFollowersFollowsCounter extends StatelessWidget {
  final int followers;
  final int following;
  final int posts;
  const PostsFollowersFollowsCounter({
    super.key,
    required this.followers,
    required this.posts,
    required this.following,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(
              'Posts',
              style: TextStyles.font15SemiBold.copyWith(
                color: AppColors.lightBrown,
              ),
            ),
            8.ph,
            Text(posts.toString(), style: TextStyles.font20SemiBold),
          ],
        ),
        Column(
          children: [
            Text(
              'Followers',
              style: TextStyles.font15SemiBold.copyWith(
                color: AppColors.lightBrown,
              ),
            ),
            8.ph,
            Text(followers.toString(), style: TextStyles.font20SemiBold),
          ],
        ),
        Column(
          children: [
            Text(
              'Following',
              style: TextStyles.font15SemiBold.copyWith(
                color: AppColors.lightBrown,
              ),
            ),
            8.ph,
            Text(
              following.toString(),
              style: TextStyles.font20SemiBold,
            ),
          ],
        ),
      ],
    );
  }
}
