import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:ensure/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerConversationLoading extends StatelessWidget {
  const ShimmerConversationLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => 16.ph,
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        top: 16.h,
      ),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          height: 80.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(40.r),
                topEnd: Radius.circular(16.r),
                bottomEnd: Radius.circular(16.r),
                bottomStart: Radius.circular(40.r),
              ),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.lighterGray,
                  blurRadius: 4,
                  offset: Offset(0, 1),
                  spreadRadius: 0,
                ),
              ]),
          child: Row(
            children: [
              Container(
                  height: 80.h,
                  width: 80.w,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.mistyRose,
                  ),
                  child: Shimmer.fromColors(
                    baseColor: AppColors.lighterGray,
                    highlightColor: AppColors.white,
                    child: Container(
                      height: 80.h,
                       width: 110.w,
                
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,                  
                  color: Colors.white,
                ),
              
                    ),
                  )),
              16.pw,
              Shimmer.fromColors(
                baseColor: AppColors.lighterGray,
                highlightColor: AppColors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 24.h,
                      width: 200.w,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
