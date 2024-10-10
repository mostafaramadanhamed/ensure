

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';

class ContentTabBar extends StatelessWidget {
  const ContentTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          25.0,
        ),
      ),
      child: TabBar(
        //  controller: _tabController,
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(
            25.0,
          ),
          color: AppColors.lighterBrown,
        ),
        labelStyle: TextStyles.font17SemiBold,
        unselectedLabelStyle: TextStyles.font15Regular,
        textScaler: const TextScaler.linear(1.0),
        labelColor: AppColors.mistyRose,
        unselectedLabelColor: AppColors.oldRose,
        tabs: const [
          Tab(
            text: 'Posts',
          ),
          Tab(
            text: 'Photos',
          ),
          Tab(
            text: 'Videos',
          ),
        ],
      ),
    );
  }
}
