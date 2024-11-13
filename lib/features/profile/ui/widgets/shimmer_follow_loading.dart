import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/theme/colors.dart';

class ShimmerFollowLoading extends StatelessWidget {
  const ShimmerFollowLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.lighterGray,
      highlightColor: Colors.white,
      child: Container(
        height: 40.h,
        width: 0.5.sw,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32.r),
        ),
      ),
    );
  }
}
