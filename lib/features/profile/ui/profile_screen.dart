import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:ensure/features/profile/ui/widgets/content_tab_bar.dart';
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
import 'widgets/tab_bar_views.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userId = Supabase.instance.client.auth.currentUser!.id;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Profile',
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

              return NestedScrollView(
                body: BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, postState) {
                    return TabBarViews(
                      userId: profile.id,
                    );
                  },
                ),
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.0.w, vertical: 16.0.h),
                            child: Row(
                              children: [
                                Container(
                                  height: 80.h,
                                  width: 80.w,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: BoxDecoration(
                                    color: AppColors.teaRose,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.mistyRose,
                                        blurRadius: 7.r,
                                        offset: const Offset(0, 3),
                                        spreadRadius: 0,
                                      ),
                                    ],
                                  ),
                                  child: profile.photoUrl != ''
                                      ? Image.network(profile.photoUrl,
                                          fit: BoxFit.cover)
                                      : Icon(
                                          Icons.person_outline_sharp,
                                          size: 75.r,
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                        ),
                                ),
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
                                        style:
                                            TextStyles.font15SemiBold.copyWith(
                                          color: AppColors.lightBrown,
                                        )),
                                    8.ph,
                                    userId == profile.id
                                        ? AppTextButton(
                                            buttonText: 'Edit Profile',
                                            onPressed: () {},
                                            buttonWidth: 200.w,
                                            buttonHeight: 42.h,
                                            textStyle: TextStyles.font15SemiBold
                                                .copyWith(
                                              color: AppColors.white,
                                            ),
                                            borderRadius: 25.r,
                                            verticalPadding: 8,
                                          )
                                        : AppTextButton(
                                            buttonText: 'Follow',
                                            onPressed: () {},
                                            buttonWidth: 200.w,
                                            buttonHeight: 42.h,
                                            textStyle: TextStyles.font15SemiBold
                                                .copyWith(
                                              color: AppColors.white,
                                            ),
                                            borderRadius: 25.r,
                                            verticalPadding: 8,
                                          ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          16.ph,
                          PostsFollowersFollowsCounter(
                            followers: profile.followersCount,
                            following: profile.followingCount,
                          ),
                          32.ph,
                          const ContentTabBar(),
                          32.ph,
                        ],
                      ),
                    ),
                  ];
                },
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
