import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/theme/colors.dart';

class ShimmerCommentLoading extends StatelessWidget {
  const ShimmerCommentLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) {
          return ListTile(
              leading: Shimmer.fromColors(
                baseColor: AppColors.lighterGray,
                highlightColor: Colors.white,
                child: const CircleAvatar(
                  radius: 20,
                ),
              ),
              title: Shimmer.fromColors(
                  baseColor: AppColors.lighterGray,
                  highlightColor: Colors.white,
                  child: Container(
                    height: 15.h,
                    width: 0.5.sw,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  )),
              subtitle:  Shimmer.fromColors(
                      baseColor: AppColors.lighterGray,
                      highlightColor: Colors.white,
                      child: Container(
                        height: 15.h,
                        width: 0.5.sw,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      )),  
            
              isThreeLine: true,
              trailing: Shimmer.fromColors(
                  baseColor: AppColors.lighterGray,
                  highlightColor: Colors.white,
                  child: Container(
                    height: 15.h,
                    width: 0.05.sw,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  )));
        });
  }
}
