import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/theme/colors.dart';

class ShimmerPostLoading extends StatelessWidget {
  const ShimmerPostLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) => 16.ph,
        itemCount: 5,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Card(
            surfaceTintColor: Colors.grey.shade300,
            color: Theme.of(context).cardColor,
            margin: EdgeInsets.symmetric(horizontal: 24.w),
            elevation: 8,
            shadowColor: AppColors.melon,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0.r)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  12.ph,
                  userImageAndNameShimmer(),
                  20.ph,
                  postTextShimmer(),
                  20.ph,
                  postImageShimmer(),
                  14.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      likesOrCommentsOrShareOrTimeShimmer(),
                      likesOrCommentsOrShareOrTimeShimmer(),
                      likesOrCommentsOrShareOrTimeShimmer(),
                      likesOrCommentsOrShareOrTimeShimmer(),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  Shimmer likesOrCommentsOrShareOrTimeShimmer() {
    return Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.white,
                        child: Container(
                            height: 15.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.r),
                            )));
  }

  Shimmer postImageShimmer() {
    return Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.white,
                    child: Container(
                        height: 250.h,
                        width: 1.sw,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                        )));
  }

  Shimmer postTextShimmer() {
    return Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.white,
                    child: Container(
                        height: 20.h,
                        width: 0.7.sw,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                        )));
  }

  ListTile userImageAndNameShimmer() {
    return ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.white,
                      child: Container(
                          height: 15.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                          ))),
                  leading: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.white,
                    child: CircleAvatar(
                      radius: 30.r,
                    ),
                  ),
                  trailing: Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.white,
                      child: Container(
                          height: 24.h,
                          width: 16.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                          ))),
                );
  }
}
