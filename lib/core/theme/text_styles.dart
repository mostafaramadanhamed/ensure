import 'package:ensure/core/helpers/font_weight_helper.dart';
import 'package:ensure/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle font36SemiBold =  TextStyle(
    fontSize: 36.sp,
    fontWeight: FontWeightHelper.semiBold,
  );

  static TextStyle font20SemiBold =  TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.semiBold,
  );

  static TextStyle font17SemiBold =  TextStyle(
    fontSize: 17.sp,
    fontWeight: FontWeightHelper.semiBold,
  );

  static TextStyle font15SemiBold =  TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.semiBold,
  );  

  static TextStyle font15Regular =  TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font12LighterBrownSemiBold =  TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.lighterBrown,
  );
  
}