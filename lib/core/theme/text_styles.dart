import 'package:ensure/core/helpers/font_weight_helper.dart';
import 'package:ensure/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle fontAppName = TextStyle(
    fontSize: 36.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.coralPink,
    fontStyle: FontStyle.italic,
    letterSpacing: 2.5.sp,
    shadows: const [
      Shadow(
        blurRadius: 5.0,
        color: AppColors.mistyRose,
        offset: Offset(2.0, 2.0),
      ),
      Shadow(
        blurRadius: 4.0,
        color: AppColors.teaRose,
        offset: Offset(1.0, 1.0),
      ),
    ],
  );
  static TextStyle font36Bold = TextStyle(
    fontSize: 36.sp,
    fontWeight: FontWeightHelper.bold,
  );

  static TextStyle font28Bold = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font20SemiBold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.semiBold,
  );

  static TextStyle font17SemiBold = TextStyle(
    fontSize: 17.sp,
    fontWeight: FontWeightHelper.semiBold,
  );

  static TextStyle font15SemiBold = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.semiBold,
  );

  static TextStyle font15Regular = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font12LighterBrownBold = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.lighterBrown,
  );
}
