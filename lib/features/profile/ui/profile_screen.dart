import 'package:easy_localization/easy_localization.dart';
import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:ensure/features/profile/ui/widgets/posts_followers_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/theme/colors.dart';
import '../../../core/theme/text_styles.dart';
import '../../../core/widgets/app_text_button.dart';
import '../data/models/profile_model.dart';
import '../domain/cubit/profile_cubit.dart';
import '../domain/cubit/profile_state.dart';
import 'widgets/profile_image.dart';
import 'widgets/shimmer_follow_loading.dart';
import 'widgets/tab_bar_views.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userId = Supabase.instance.client.auth.currentUser!.id;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'.tr(),
            style: TextStyles.font20SemiBold
                .copyWith(fontSize: 23.sp, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ProfileError) {
            return Center(child: Text(state.message));
          }
          if (state is ProfileSuccess) {
            ProfileModel profile = state.profile;

            return ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.0.w, vertical: 16.0.h),
                      child: Row(
                        children: [
                          ProfileImage(profile: profile),
                          16.pw,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                profile.name,
                                style: TextStyles.font20SemiBold,
                              ),
                              8.ph,
                              Text(profile.bio,
                                  style: TextStyles.font15SemiBold.copyWith(
                                    color: AppColors.lightBrown,
                                  )),
                              8.ph,
                              userId == profile.id
                                  ? AppTextButton(
                                      buttonText: 'Edit Profile'.tr(),
                                      onPressed: () {},
                                      buttonWidth: 200.w,
                                      buttonHeight: 42.h,
                                      textStyle:
                                          TextStyles.font15SemiBold.copyWith(
                                        color: AppColors.white,
                                      ),
                                      borderRadius: 25.r,
                                      verticalPadding: 8,
                                    )
                                  : FutureBuilder<bool>(
                                      future: context
                                          .read<ProfileCubit>()
                                          .checkFollowing(userId, profile.id),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return const ShimmerFollowLoading();
                                        }
                                        if (snapshot.hasError) {
                                          return Text(
                                              'Error: ${snapshot.error}');
                                        }
                                        if (!snapshot.hasData) {
                                          return  Text('No data'.tr());
                                        }
                                        if (snapshot.data == true) {
                                          return AppTextButton(
                                            buttonText: 'Unfollow'.tr(),
                                            onPressed: () {
                                              context
                                                  .read<ProfileCubit>()
                                                  .setFollow(
                                                      userId, profile.id);
                                            },
                                            buttonWidth: 200.w,
                                            buttonHeight: 42.h,
                                            backgroundColor: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                            textStyle: TextStyles.font15SemiBold
                                                .copyWith(
                                                    //     color: AppColors.white,
                                                    ),
                                            borderRadius: 25.r,
                                            verticalPadding: 8,
                                          );
                                        }
                                        if (snapshot.data == false) {
                                          return AppTextButton(
                                            buttonText: 'Follow'.tr(),
                                            onPressed: () {
                                              context
                                                  .read<ProfileCubit>()
                                                  .setFollow(
                                                      userId, profile.id);
                                            },
                                            buttonWidth: 200.w,
                                            buttonHeight: 42.h,
                                            textStyle: TextStyles.font15SemiBold
                                                .copyWith(
                                              color: AppColors.white,
                                            ),
                                            borderRadius: 25.r,
                                            verticalPadding: 8,
                                          );
                                        }
                                        return const SizedBox.shrink();
                                      }),
                            ],
                          ),
                        ],
                      ),
                    ),
                    16.ph,
                    PostsFollowersFollowsCounter(
                      followers: profile.followersCount,
                      following: profile.followingCount,
                      posts: profile.posts,
                    ),
                    32.ph,
                    buildPostsWordBeforePosts(),
                  ],
                ),
                32.ph,
                PostsPorfile(userId: profile.id),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  Container buildPostsWordBeforePosts() {
    return Container(
                    height: 50,
                    width: double.infinity,
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      color: AppColors.lighterBrown,
                      borderRadius: BorderRadius.circular(
                        25.0,
                      ),
                    ),
                    child: Text('Posts'.tr(),
                        style: TextStyles.font17SemiBold
                            .copyWith(color: AppColors.mistyRose)),
                  );
  }
}
