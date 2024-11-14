import 'package:easy_localization/easy_localization.dart';
import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';

class SignGoogleButton extends StatelessWidget {
  final bool isSignup;
  const SignGoogleButton({
    super.key,  this.isSignup=false,
  });

  @override

  /// A button to sign in or sign up with Google.
  ///
  /// This widget is a text button with a rounded rectangle shape and a
  /// misty rose border. It contains a Google icon and a text "Sign in with
  /// Google".
  ///
  /// When pressed, it does nothing.
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
       

      },
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0.r),
            side: const BorderSide(
              color: AppColors.mistyRose,
              width: 2,
            ),
          ),
        ),
        fixedSize: WidgetStateProperty.all(
          Size(300.w, 55.h),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/svg/google.svg',
            height: 30.h,
          ),
          20.pw,
          Text(
           isSignup ? "Sign up with Google".tr() : "Sign in with Google".tr(),
            style: TextStyles.font15Regular,
          ),
        ],
      ),
    );
  }
}
