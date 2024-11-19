import 'package:easy_localization/easy_localization.dart';
import 'package:ensure/core/helpers/navigation_extension.dart';
import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:ensure/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../domain/cubit/profile_cubit.dart';

class PostsFollowersFollowsCounter extends StatelessWidget {
  final int followers;
  final int following;
  final int posts;
  final String userId;
  const PostsFollowersFollowsCounter({
    super.key,
    required this.followers,
    required this.posts,
    required this.following, required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(
              'Posts'.tr(),
              style: TextStyles.font15SemiBold.copyWith(
                color: AppColors.lightBrown,
              ),
            ),
            8.ph,
            Text(posts.toString(), style: TextStyles.font20SemiBold),
          ],
        ),
        GestureDetector(
          onTap: () async{
         final followers=   await context.read<ProfileCubit>().getFollowers(userId);
            context.pushNamed(
              Routes.displayFollowers,
              arguments: followers,
            );
          },
          child: Column(
            children: [
              Text(
                'Followers'.tr(),
                style: TextStyles.font15SemiBold.copyWith(
                  color: AppColors.lightBrown,
                ),
              ),
              8.ph,
              Text(followers.toString(), style: TextStyles.font20SemiBold),
            ],
          ),
        ),
        InkWell(
            onTap: () async{
         final following=   await context.read<ProfileCubit>().getFollowing(userId);
            context.pushNamed(
              Routes.displayFollowing,
              arguments: following,
            );
          },
          child: Column(
            children: [
              Text(
                'Following'.tr(),
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
        ),
      ],
    );
  }
}
