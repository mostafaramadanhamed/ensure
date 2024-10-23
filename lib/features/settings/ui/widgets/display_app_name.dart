import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';

class DisplayUserName extends StatelessWidget {
  final Map<String, dynamic> user;
  const DisplayUserName({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
 return Container(
      height: 120.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.mistyRose,
              blurRadius: 7.r,
              offset: const Offset(0, 3),
              spreadRadius: 0,
            ),
          ]),
      child: Row(
        children: [
       Container(
              height: 120.h,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: AppColors.mistyRose,
              ),
              child:  user['profile_pic'] != null ? Image.network(user['profile_pic'],fit: BoxFit.cover) :  Icon(
                Icons.person_outline_rounded,
                size: 88.sp,
                color: AppColors.coralPink,
              )),
          16.pw,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              8.ph,
              Text(user['name'], style: TextStyles.font17SemiBold),
              Text(
                user['email'],
                style: TextStyles.font15Regular,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
