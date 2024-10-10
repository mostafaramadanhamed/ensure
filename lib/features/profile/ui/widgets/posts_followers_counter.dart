

import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';

class PostsFollowersFollowsCounter extends StatelessWidget {
  const PostsFollowersFollowsCounter({
    super.key,
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
            Text('327', style: TextStyles.font20SemiBold),
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
            Text('77.8K', style: TextStyles.font20SemiBold),
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
              '1',
              style: TextStyles.font20SemiBold,
            ),
          ],
        ),
      ],
    );
  }
}
