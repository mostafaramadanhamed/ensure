import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:ensure/core/theme/colors.dart';
import 'package:ensure/core/theme/text_styles.dart';
import 'package:ensure/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/content_tab_bar.dart';
import 'widgets/posts_followers_counter.dart';
import 'widgets/tab_bar_views.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Profile',
              style: TextStyles.font20SemiBold
                  .copyWith(fontSize: 23.sp, fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: NestedScrollView(
          body: const TabBarViews(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.0.w, vertical: 16.0.h),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 45.r,
                            backgroundImage: const NetworkImage(
                                'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                                scale: 0.5),
                          ),
                          16.pw,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mostafa Ramadan',
                                style: TextStyles.font20SemiBold,
                              ),
                              8.ph,
                              Text('@mostafaramadan',
                                  style: TextStyles.font15SemiBold.copyWith(
                                    color: AppColors.lightBrown,
                                  )),
                              8.ph,
                              AppTextButton(
                                buttonText: 'Edit Profile',
                                onPressed: () {},
                                buttonWidth: 200.w,
                                buttonHeight: 42.h,
                                textStyle: TextStyles.font15SemiBold.copyWith(
                                  color: AppColors.white,
                                ),
                                borderRadius: 25.r,
                                verticalPadding: 8,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    16.ph,
                    const PostsFollowersFollowsCounter(),
                    32.ph,
                    const ContentTabBar(),
                    32.ph,
                  ],
                ),
              ),
            ];
          },
        ),
      ),
    );
  }
}
