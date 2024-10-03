import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors.dart';

class TopContainer extends StatelessWidget {
  const TopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
                
                decoration: const BoxDecoration(
                  color: AppColors.coralPink,
                  gradient: LinearGradient(
                    colors: [
                      AppColors.teaRose,
                      AppColors.teaRose,
                      AppColors.coralPink,
                    ],
                    stops: [0.05, 0.2, 0.45],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                 

                    70.ph,
                    Container(
                      height: 16.h,
                      margin: EdgeInsets.symmetric(horizontal: 24.w),
                      decoration: BoxDecoration(
                          color: AppColors.teaRose.withOpacity(0.8),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.r),
                            topRight: Radius.circular(20.r),
                          )),
                    ),
                    Container(
                      height: 20.h,
                      decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.r),
                            topRight: Radius.circular(20.r),
                          )),
                    ),
                  ],
                ),
              );
  }
}
