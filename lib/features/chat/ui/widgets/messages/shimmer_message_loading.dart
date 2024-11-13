import 'package:ensure/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerMessageLoading extends StatelessWidget {
  const ShimmerMessageLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Align(
              alignment: index % 2 == 0
                  ? AlignmentDirectional.centerEnd
                  : AlignmentDirectional.centerStart,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 0.75.sw,
                  minWidth: 0.35.sw,
                  minHeight: 0.06.sh,
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  child: Shimmer.fromColors(
                    baseColor: AppColors.lighterGray,
                    highlightColor: Colors.white,
                    child: Container(
                      height: 55.h,
                      width: 0.5.sw,
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(12.r),
                     ),
                    ),
                  ),
                ),
              ));
        });
  }
}
